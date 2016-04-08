//argument0 - actor
//argument1 - button to perform

actor = argument0;

button = argument1;

switch(button.title){
    //default --------------
    case "END TURN":
        actor.state = "begin action";
        actor.readiedAction = "end turn";
        actor.targetingType = "none";
        
        with(instance_create(room_width/2, room_height, oConfirmButton)){
            title = other.button.title;
            
            text = other.button.text;
            
            hotkey = other.button.hotkey;
        }
        
        wipe_nodes();
        wipe_buttons();
        
        break;
        
    //cleric
    case "BLESS":
        actor.state = "begin action";
        actor.readiedAction = "Bless";
        actor.targetingType = "visible allies";
        actor.actionRange = 640;
        
        with(instance_create(room_width/2, room_height, oConfirmButton)){
            title = other.button.title;
            text = other.button.text;
        }
        
        wipe_nodes();
        wipe_buttons();
        
        break;
    case "GUIDING BOLT":
        actor.state = "begin action";
        actor.readiedAction = "Guiding Bolt";
        actor.targetingType = "visible enemies";
        actor.actionRange = 640;
        
        with(instance_create(room_width/2, room_height, oConfirmBox)){
            title = other.button.title;
            text = other.button.text;
        }
        
        wipe_nodes();
        wipe_buttons();
        
        break;
    case "HEALING WORD":
        actor.state = "begin action";
        actor.readiedAction = "Healing Word";
        actor.targetingType = "visible allies";
        actor.actionRange = 640;
        
        with(instance_create(room_width/2, room_height, oConfirmBox)){
            title = other.button.title;
            text = other.button.text;
        }
        
        wipe_nodes();
        wipe_buttons();
        
        break;
    
    
    //wizard
    case "ACID ORB":
        actor.state = "begin action";
        actor.readiedAction = "Acid Orb";
        actor.targetingType = "visible enemies";
        actor.actionRange = 640;
        
        with(instance_create(room_width/2, room_height, oConfirmBox)){
            title = other.button.title;
            text = other.button.text;
        }
        
        wipe_nodes();
        wipe_buttons();
            
        break;
    case "BURNING HANDS":
        actor.state = "begin action";
        actor.readiedAction = "Burning Hands";
        actor.targetingType = "cone";
        actor.actionRange = 96;
        
        with(instance_create(room_width/2, room_height, oConfirmBox)){
            title = other.button.title;
            text = other.button.text;
        }
        
        wipe_nodes();
        wipe_buttons();
            
        break;
    case "MAGIC MISSILES":
        actor.state = "begin action";
        actor.readiedAction = "Magic Missiles";
        actor.targetingType = "visible enemies";
        actor.actionRange = 640;
        
        with(instance_create(room_width/2, room_height, oConfirmButton)){
            title = other.button.title;
            text = other.button.text;
            
            hotkey = other.button.hotkey;
        }
        
        wipe_nodes();
        wipe_buttons();
            
        break;
}
