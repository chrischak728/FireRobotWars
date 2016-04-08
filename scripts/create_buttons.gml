//argument0 - actor

actor = argument0;

buttonList = ds_list_create();

//add actions to button list
if(actor.canAct && actor.firstLevelSlot>0){
    for(ii=0;ii<ds_list_size(actor.firstLevelSpellList);ii++){
        ds_list_add(buttonList, ds_list_find_value(actor.firstLevelSpellList, ii));
    }
}

for(ii=0; ii<ds_list_size(actor.defaultActions);ii++){
    ds_list_add(buttonList, ds_list_find_value(actor.defaultActions,ii));    
}

buttonY = room_height - 48;
buttonX = room_width/2 - (ds_list_size(buttonList)-1)*48;

for(ii=0; ii<ds_list_size(buttonList);ii++){
    button = ds_list_find_value(buttonList, ii);
    switch(button){
        //default --------------------
        case "end turn":
            with(instance_create(buttonX+ (ii*96), buttonY, oButton)){
                sprite_index = sButtonEndTurn;
                title = "END TURN";
                text = "Finish turn of current character";
                hotkey = "X";
            }        
            break;
            
        //cleric spells ------------------
        case "Bless":
            with(instance_create(buttonX+ (ii*96), buttonY, oButton)){
                title = "BLESS";
                text = "Give all party members a small bonus to attack and save rolls#1d4 bonus (5 rounds)";
                hotkey = string(other.ii+1);
                spell = true;
                spellSlot = string(other.actor.firstLevelSlot);
            }  
            break;
        case "Guiding Bolt":
            with(instance_create(buttonX+ (ii*96), buttonY, oButton)){
                title = "GUIDING BOLT";
                text = "Right click an enemy to fire a bolt!#4d6 RADIANT damage#bonus on next attack against target!";
                hotkey = string(other.ii+1);
                spell = true;
                spellSlot = string(other.actor.firstLevelSlot);
            }  
            break;
        case "Healing Word":
            with(instance_create(buttonX+ (ii*96), buttonY, oButton)){
                title = "HEALING WORD";
                text = "Right click  an ally in range to heal them!#1d8" + string(other.actor.wisMod)+" HEALING";
                hotkey = string(other.ii+1);
                spell = true;
                spellSlot = string(other.actor.firstLevelSlot);
            }  
            break;
        
        
        //wizard spelss -----------------
        case "Acid Orb":
            with(instance_create(buttonX+ (ii*96), buttonY, oButton)){
                title = "ACID ORB";
                text = "Right click an enemy to fire an orb of deadly acid!#3d10 Acid damage#ongoing burn";
                hotkey = string(other.ii+1);
                spell = true;
                spellSlot = string(other.actor.firstLevelSlot);
            }        
            break;
        case "Burning Hands":
            with(instance_create(buttonX+ (ii*96), buttonY, oButton)){
                title = "BURNING HANDS";
                text = "Right click  a square in range to emit a cone of flames!#3d6 FIRE damage (AOE)";
                hotkey = string(other.ii+1);
                spell = true;
                spellSlot = string(other.actor.firstLevelSlot);
            }        
            break;
        case "Magic Missiles":
            with(instance_create(buttonX+ (ii*96), buttonY, oButton)){
                title = "MAGIC MISSILES";
                text = "Fire a Magic Missile at each visible nemy#1d4 FORCE damage#cannot miss!";
                hotkey = string(other.ii+1);
                spell = true;
                spellSlot = string(other.actor.firstLevelSlot);
            }        
            break;
    }
}

ds_list_destroy(buttonList);
