ally = 0;
enemy = 0;

with(oActor){
    if(army==BLUE_ARMY){
        other.ally++;
    } else if(army==RED_ARMY){
        other.enemy++;
    }
}

if(ally==0){
    return GAME_LOSE;
} else if(enemy==0){
    return GAME_WIN;
} else {
    return false;
}
