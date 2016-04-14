//Arg0 = actorId;
actorId = argument0;
moveRange = argument1;
alliesNode[0] = noone;
count = 0;
isPaired = false;
tmp = 0;


with(oActor){
    if(army==RED_ARMY && id != other.actorId){
        other.alliesNode[other.count] = find_node_by_actor(id);
        other.count++;
    }
}

//sort the array by G value ascending
swapped = true;
j = 0;
while(swapped){
    swapped = false;
    j++;
    for(i = 0 ; i < count - j ; i++){
        if(alliesNode[i].G > alliesNode[i+1].G){
            tmp = alliesNode[i];
            alliesNode[i] = alliesNode[i+1];
            alliesNode[i+1] = tmp;
            swapped = true;
        }   
    }
}

for(i=0;i < count ;i++){
    show_debug_message("id : " + string(alliesNode[i]) + " , G : " + string(alliesNode[i].G));
}
    

if(alliesNode[0].G > moveRange){
    return alliesNode[0];
}
else {
    return -1;
}
