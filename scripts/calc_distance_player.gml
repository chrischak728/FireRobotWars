//arg0 = targetId , arg1 = AI_Id
var targetId = argument0;
var AI_Id = argument1;

x1 = targetId.gridX
x2 = AI_Id.gridX
y1 = targetId.gridY
y2 = AI_Id.gridY

d = sqrt( sqr(x2 - x1) + sqr(y2 - y1) );

return d;
