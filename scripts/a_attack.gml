//arg0 = fromNode , arg1 = targetNode , arg2 = actorId , arg3 = targetId

from = argument0;
to = argument1;
actorId = argument2;
targetId = argument3;

switch(actorId.attackType){
    case "ranged":
        actorId.canAct = false;
        actorId.actions--;
        actorId.attackTarget = targetId;
        actorId.state = "begin attack";
        actorId.actionTimer = 10;
                
        actorId = noone;
        
        //wipe_nodes();
        //wipe_buttons();
        break;
    
    case "melee":
        actorId.canAct = false;
        actorId.attackTarget = targetId;
        
        tempX = abs(to.gridX - actorId.gridX);
        tempY = abs(to.gridY - actorId.gridY);
        
        if(tempX <= 1 && tempY <=1){
            actorId.actions--;
            actorId.state = "begin attack";
            actorId.actionTimer = 10;
            
            actorId = noone;
            wipe_nodes();
            //wipe_buttons();
        } else {
            tempG = 100;
            current = noone;
            
            for(ii=0; ii<ds_list_size(to.neighbors);ii++){
                tempNode = ds_list_find_value(to.neighbors, ii);
                
                if(tempNode.occupant == noone && tempNode.G > 0 && tempNode.G < tempG){
                    tempG = tempNode.G;
                    current = tempNode;
                }
            }
            
            targetNode = current;
            
            
            create_path(actorId, targetNode);
            
            //clear actorId node
           map[actorId.gridX, actorId.gridY].occupant = noone;
           
           //update selected actor pos
           actorId.gridX = targetNode.gridX;
           actorId.gridY = targetNode.gridY;
           
           //update actorId's future node
           targetNode.occupant = actorId;
           
           //send actor on its way
           actorId.state = "begin path";
           actorId.endPath = "begin attack";
           
           actorId.attackTarget = to.occupant;
           actorId.actions-=2;
           actorId.canAct = false;
           
           actorId = noone;
           //wipe_nodes();
           //wipe_buttons();
        }
        
        break;
    
} 
