//argument0 = actor
//arguemnt1 = desc node

current = argument1;
selectedActor = argument0;

//**create priority queue
 path = ds_priority_create();
 
 //add 1st node to queue  priority = G
 ds_priority_add(path,current,current.G);
 //scan through all parent to parent
 while (current.parent != noone){
     ds_priority_add(path, current.parent, current.parent.G);
     //next
     current = current.parent;
 }
 do {
     //delete lowest priority node
     current = ds_priority_delete_min(path);
     //add current node's sprite
     path_add_point(selectedActor.movementPath, current.x, current.y, 100);
 } until(ds_priority_empty(path));
//free path memory
ds_priority_destroy(path);
