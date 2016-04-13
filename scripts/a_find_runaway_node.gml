//Based on a_find_move_node

nextNode = argument0;
range = argument1;
moveToNode = noone;
path[0] = noone;
nodeCount = 0;
//In case AI needs to move , AI should move to neigbhors closest to target.
found = false;
while(!found){
    for(i=0; i < ds_list_size(nextNode.neighbors) ; i++){
        tempNode = ds_list_find_value(nextNode.neighbors,i);
        if(tempNode.occupant == noone && tempNode.passable){
            nextNode = tempNode;
            found = true;
        }
    }
}

//get a set of path nodeIDs to the targetNode
while(nextNode.parent != noone){
    show_debug_message(string(nodeCount) + " :  nextNode : " + string(nextNode));
    nextNode.color = c_black;       // Move path is colored black here
    path[nodeCount] = nextNode;
    nextNode = nextNode.parent;
    nodeCount++;
}

//sort the array by G value descending
swapped = true;
j = 0;
while(swapped){
    swapped = false;
    j++;
    for(i = 0 ; i < nodeCount - j ; i++){
        if(path[i].G < path[i+1].G){
            tmp = path[i];
            path[i] = path[i+1];
            path[i+1] = tmp;
            swapped = true;
        }   
    }
}

for(i=0;i < nodeCount ;i++){
    show_debug_message("id : " + string(path[i]) + " , G : " + string(path[i].G));
}
    

//This tells the furthest node AI can move in a turn
isOutRange = false;
count=0;
while(!isOutRange && count < nodeCount){
    show_debug_message("count : " + string(count));
    if(path[count].G > range){
        isOutRange = true;
        moveToNode = path[--count];
        break;
    }
    count++;
    
}

//The target node can be reached in 1 turn
if(!isOutRange)
    moveToNode = path[count-1];

//if the node is occipided , 
while(moveToNode.occupant != noone && count > 0){
    show_debug_message("count : (2) " + string(count));
    moveToNode = path[--count];
}

return moveToNode;
