//arg0 - actor

actor = argument0;

if(actor.army == BLUE_ARMY){
    tempArmy = "Ally";
} else {
    tempArmy = "Enemy";
}

tempName = actor.name;

tempHP = "(HP: "+ string(actor.currentHP)+"/"+string(actor.maxHP)+")";

tempState = " State : " + string(actor.state);

return tempArmy+": "+tempName+tempHP + tempState;

