count = 0;
targetId = noone;
with(oActor){
    if(army==BLUE_ARMY){
        other.playerActors[other.count] = id;
        other.count++;
    }
}

targetId = playerActors[0];


//Pick one with lowest health
for(i = 1 ; i < count ; i++){
    if(targetId.currentHP > playerActors[i].currentHP)
        targetId = playerActors[i].id;
}

return targetId;
