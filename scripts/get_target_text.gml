//arg0 - actor

actor = argument0;

if(actor.army == BLUE_ARMY){
    tempArmy = "Ally";
} else {
    tempArmy = "Enemy";
}

tempName = actor.name;

tempHP = "(HP: "+ string(actor.currentHP)+"/"+string(actor.maxHP)+")";

return tempArmy+": "+tempName+tempHP;

