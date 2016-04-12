//Arg0 = actorId;
actorId = argument0;

count = 0;
targetId = noone;
playerActors[0] = noone;
targetsInRange[0] = noone;
countInRange = 0;

with(oActor){
    if(army==BLUE_ARMY){
        other.playerActors[other.count] = id;
        other.count++;
    }
}
targetId = playerActors[0];

//search for anyone within attack range
for(i = 0 ; i < count ; i++){
    playerNode = find_node_by_actor(playerActors[i]);
    if(playerNode.G < actorId.move){
        targetsInRange[countInRange] = playerActors[i];
        countInRange++;
        }
}

//multiple targets in range , pick one with lowest health
if(countInRange > 0){
    targetId = targetsInRange[0];
    for(i = 1 ; i < countInRange ; i++){
        if(targetId.currentHP > targetsInRange[i].currentHP)
            targetId = targetsInRange[i];
    }
} else {    //No target in range , Pick one with lowest health and move towards him
    targetId = playerActors[0];
    for(i = 1 ; i < count ; i++){
        if(targetId.currentHP > playerActors[i].currentHP)
            targetId = playerActors[i].id;
    }
}

return targetId;
