//arg0 - actor
//arg1 - canAct
//arg2 - action to reduce
//arg3 - levelSlot to reduce
//arg4 - state
//arg5 - actionTimer

actor = argument0;

with(actor){
    canAct = argument1;
    actions -= argument2;
    firstLevelSlot -= argument3;
    state = argument4;
    actionTimer = argument5;
}
