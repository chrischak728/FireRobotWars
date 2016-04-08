//arg0 - actor
//arg1 - targetting type
//arg2 - targetting range

actor = argument0;
targetingType = argument1;
range = argument2;

switch(targetingType){
    case "cone":
        originX = actor.x + 16;
        originY = actor.y + 16;
        dir = point_direction(originX, originY, oCursor.hoverNode.x +16, oCursor.hoverNode.y +16);
        
        originX += lengthdir_x(31, dir);
        originY += lengthdir_y(31, dir);
        dist = range - 16;
        
        for(ii=-30; ii<=30; ii+=15){
            for(jj = 0; jj<=dist ; jj+=8){
                tempX = originX + lengthdir_x(jj, dir+ii);
                tempY = originY + lengthdir_y(jj, dir+ii);
                
                if(!collision_line(originX, originY, tempX, tempY, oWall, false, false)){
                    if(instance_position(tempX, tempY, oNode)){
                        node = instance_position(tempX, tempY, oNode);
                        
                        if(node.type!="wall"){
                            node.actionNode = true;
                            node.color = c_purple;
                        }
                    }
                }
            }
        }
        
        break;   
    
    case "visible allies":
        with(oActor){
            if(army == other.actor.army){
                if(!collision_line(x, y, other.actor.x, other.actor.y, oWall, false, false)){
                    node = map[gridX, gridY];
                    
                    node.actionNode = true;
                    node.color = c_purple;
                }
            }
        } 
        break;
    case "visible enemies":
        with(oActor){
            if(army != other.actor.army){
                if(!collision_line(x, y, other.actor.x, other.actor.y, oWall, false, false)){
                    node = map[gridX, gridY];
                    
                    node.actionNode = true;
                    node.color = c_purple;
                }  
            }
        }    
        break;
}
