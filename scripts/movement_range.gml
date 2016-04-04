//args0 = origin node, arg1 = move var, arg2 = number of remaining actions

//reset pathfinding
wipe_nodes();

var open, closed;
var start, current, neighbor;
var tempG, range, costMod, i;

//args assignment

start = argument0;
range = argument1 * argument2;

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
        if (neighbor.passable && neighbor.occupant == noone && neighbor.cost + current.G <= range && ds_list_find_index(closed, neighbor)< 0){
            //calc new G for neighbor if not yet calculated
            if (ds_priority_find_priority(open, neighbor) == 0 || ds_priority_find_priority(open, neighbor) == undefined){
                costMod=1;
                
                //give neighbor parent
                neighbor.parent = current;
                
                //if node is diagonal, modify costmod var
                if (neighbor.gridX != current.gridX && neighbor.gridY != current.gridY){
                    costMod = 1.5
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

//destroy closed list
ds_list_destroy(closed);


