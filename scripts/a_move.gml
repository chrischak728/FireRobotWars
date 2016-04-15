//arg0 = fromNode , arg1 = toNode , arg2 = actorId

from = argument0;
to = argument1;
actorId = argument2;


create_path(actorId, to);

map[from.gridX, from.gridY].occupant = noone;

//update actor position
to.occupant = actorId
actorId.gridX = to.gridX;
actorId.gridY = to.gridY;


actorId.state = "begin path";
actorId.endPath = "ready";

//to.color = c_black;

if (to.G > actorId.move){
        actorId.actions -=2;
        //wipe_nodes();
   } else {
        actorId.actions --;
        //wipe_nodes();
   }
