//arg0 - actor id
//arg1 - target id

actor = argument0;
target = argument1;

roll = actor.attackRoll;
status = "miss";

if(actor.attackRoll == 20){
    status = "crit";
} else {
    if(actor.blessed > 0){
        roll += irandom_range(1,4);
    }
    if(roll + actor.hitBonus >= target.armorClass){
        status = "hit";
    } else {
        status = "miss";
    }
}

return status;
