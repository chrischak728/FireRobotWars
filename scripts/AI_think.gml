//args0 = origin node, arg1 = move var, arg2 = number of remaining actions

//reset pathfinding
wipe_nodes();

var open, closed;
var start, current, neighbor;
var tempG, range, costMod, i;
var isAI, actorId;
var rndNodeId , rndno;

//args assignment

start = argument0;
range = argument1 * argument2;

//args for AI
isAI = argument3;
actorId = argument4;

//init data structure
open = ds_priority_create();
closed = ds_list_create();

// add starting ndoe to list
ds_priority_add(open, start, start.G);
//while open queue != empty
//repeat below
while (ds_priority_size(open) > 0) {
    //remove node with loest G from open and store the Id in current i.e. current standing position
    current = ds_priority_delete_min(open);
    //add it to closed list
    ds_list_add(closed, current);
    
    for (i = 0; i < ds_list_size(current.neighbors); i++){
        neighbor = ds_list_find_value(current.neighbors, i);
        
        /* add neighbor to list if valid
            passable, no occupant, G< range, !in closed list
        */
        
        
        //if (neighbor.passable && neighbor.occupant == noone && neighbor.cost + current.G <= range && ds_list_find_index(closed, neighbor)< 0){
        if (neighbor.passable && ds_list_find_index(closed, neighbor)< 0){

            //calc new G for neighbor if not yet calculated
            if (ds_priority_find_priority(open, neighbor) == 0 || ds_priority_find_priority(open, neighbor) == undefined){
                costMod=1;
                
                //give neighbor parent
                neighbor.parent = current;
                
                //if node is diagonal, modify costmod var
                if (neighbor.gridX != current.gridX && neighbor.gridY != current.gridY){
                    costMod = 2
                }
                //calc G of neighbor with costMod in place.
                neighbor.G = current.G + (neighbor.cost * costMod);
                
                //add neighbor to list for checking
                ds_priority_add(open, neighbor, neighbor.G);
            } else {
                // if neighbor G already calc
                
                //find if neighbor will be lowered if found from current node
                
                tempG = current.G + neighbor.cost;
                
                if (tempG < neighbor.G){
                    neighbor.parent = current;
                    neighbor.G = tempG;
                    ds_priority_change_priority(open, neighbor, neighbor.G);
                }
            }
        }
        
        
    }
}


//round-down G to integer for calc movement

with(oNode){
    G = floor(G);    
}

//free memory from open queue
ds_priority_destroy(open);

//color move nodes then destroy closed list
for (i=0;i <ds_list_size(closed); i++){
    current = ds_list_find_value(closed,i);
    current.moveNode = true;
    
    color_move_node(current, argument1, argument2);
    
}

switch(actorId.attackType){
    case "melee":
        melee_attack_range(actorId);
        break;
    case "ranged":
        ranged_attack_range(actorId);
        break;
}


if(isAI){
    //Note that : neighbor.occupant == noone commented , so it will move directly INTO player's position    
    /*To pause at any position , add :
    
        actorId.state = "begin path";
        actorId.endPath = "ready";
        
    then comment all thing below it.
    */
    
    
    targetId = search_target(actorId);
    targetNode = find_node_by_actor(targetId);
    moveToNode = noone;
    show_debug_message("target : " + string(targetId.name) + "ToNode : " + string(targetNode.id));
    
    //If the AI's HP is much lower than player, it may run away.
    var targetHealth = targetId.currentHP/targetId.maxHP;
    var aiHealth = actorId.currentHP/actorId.maxHP;
    var prob_runAway = random_range(0.0,10.0);
    //Implementation
    if(aiHealth<=targetHealth*0.5 && prob_runAway>=0.3 && targetNode.gridX<=25 && targetNode.gridY>=6){
        var exitNode = map[31,1];
        moveToNode = a_find_move_node(exitNode,range);
        a_move(start, moveToNode , actorId);
    }
    else{
    //Is the target within attack range?
        if(targetNode.attackNode = true){
                a_attack(start , targetNode , actorId , targetId);
        } else {
            //use this function to get the furthest that AI can move in THIS round
            
            //Move to allies if too far away.
            tempNode = search_allies_within_range(actorId , range);
            if(tempNode > 0){
                targetNode = tempNode;
            }
            
            moveToNode = a_find_move_node(targetNode , range);   
            a_move(start , moveToNode , actorId);
        }     
    } 
}

//destroy closed list
ds_list_destroy(closed);

start.moveNode = false;
