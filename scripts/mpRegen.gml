 //mp regen checking+imple
if (firstLevelSlot != 2){
    firstLevelSlotRegenTimer ++;
    show_debug_message(firstLevelSlotRegenTimer);
}
if (firstLevelSlotRegenTimer ==3){
    firstLevelSlotRegenTimer = 0;
    firstLevelSlot++;
    show_debug_message(firstLevelSlotRegenTimer);
}
