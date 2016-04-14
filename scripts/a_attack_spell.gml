//argument0 - actor
//argument1 - button to perform

actor = argument0;
spellName = argument1;
targetNode = argument2; // used to HACK the oCursor.hoverNode

switch(spellName){
    case "HEALING WORD":
        actor.state = "begin action";
        actor.readiedAction = "Healing Word";
        actor.targetingType = "visible allies";
        actor.actionRange = 640;
        
        with(instance_create(room_width/2, room_height, oConfirmBox)){
            title = other.spellName;
            text = " ";
        }
        oCursor.hoverNode = targetNode;
        targetNode.actionNode = true;
        change_stats_after_action(actor, false, 1, 1, "end action", 30);
        break;
    
    //wizard
    case "ACID ORB":
        actor.state = "begin action";
        actor.readiedAction = "Acid Orb";
        actor.targetingType = "visible enemies";
        actor.actionRange = 640;
        
        with(instance_create(room_width/2, room_height, oConfirmBox)){
            title = other.spellName;
            text = " ";
        }
        
        oCursor.hoverNode = targetNode;
        targetNode.actionNode = true;
        change_stats_after_action(actor, false, 1, 1, "end action", 30);
        break;
}
