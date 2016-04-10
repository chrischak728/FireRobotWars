//arg0 = fromNode, arg1 = toNode;
var from = argument0;
var to = argument1;

x1 = from.gridX
x2 = to.gridX
y1 = from.gridY
y2 = to.gridY

d = sqrt( sqr(x2 - x1) + sqr(y2 - y1) );

return d;
