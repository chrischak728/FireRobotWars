//argument0 = actor

actor = argument0;

actions = actor.actions;

if(actor.charge){
    range = actor.move * actor.actions;
} else {
    range = actor.move;
}


with(oActor){
    if(army!=other.actor.army){
        tempX = abs(gridX - other.actor.gridX);
        tempY = abs(gridY - other.actor.gridY);
        
        if(tempX <= 1 && tempY <=1){
            map[gridX, gridY].attackNode = true;
            map[gridX, gridY].color = c_red;
        } else {
            if(other.actor.actions>1){
                node = map[gridX, gridY];
                
                for(ii=0;ii<ds_list_size(node.neighbors);ii++){
                    neighbor = ds_list_find_value(node.neighbors, ii);
                    
                    if(neighbor.G>0 && neighbor.G <= other.range){
                        map[gridX, gridY].attackNode = true;
                        map[gridX, gridY].color = c_red;
                    }
                }
            }
        }
    }
}
