//arg0 - actor
//arg1 - level
//arg2 - class

actor = argument0;
level = argument1;
class = argument2;

for(ii=1; ii<=level; ii++){
    switch(class){
        case "Cleric":
            switch(ii){
                case 1:
                    ds_list_add(actor.firstLevelSpellList, "Bless");
                    ds_list_add(actor.firstLevelSpellList, "Guiding Bolt");
                    ds_list_add(actor.firstLevelSpellList, "Healing Word");
                    break;
            }
            break;
        
        case "Wizard":
            switch(ii){
                case 1:
                    ds_list_add(actor.firstLevelSpellList, "Acid Orb");
                    ds_list_add(actor.firstLevelSpellList, "Burning Hands");
                    ds_list_add(actor.firstLevelSpellList, "Magic Missiles");
                    break;
            }
            break;
    }
}
