/// @description Insert description here
// You can write your code in this editor
sprite_index = spr_Enemy_Small_Idle;	

//instance_deactivate_object(self);

//var nearestEnemy = instance_nearest(x, y, obj_Collision);
//instance_activate_object(self);
//if (nearestEnemy != id) {
		
//	var enemyDist = distance_to_object(nearestEnemy);
	
//	while (enemyDist <= 2) {
//		playerdirection = point_direction(x,y,nearestEnemy.x, nearestEnemy.y);
//		direction = playerdirection+180
//		speed = 2;
//	}
//	show_debug_message(enemyDist);
//}




if (object_exists(obj_Player)) {
	
	var dist = distance_to_object(obj_Player);
	
	if (distance_to_object(obj_Player) < aggroLength && dist > 10) {
		instance_deactivate_object(self);
		var nearestCollision = instance_nearest(x, y, obj_Collision);
		instance_activate_object(self);
		var enemyDist = distance_to_object(nearestCollision);
		
		if (enemyDist <= 2) {
			var facing = point_direction(x, y, nearestCollision.x, nearestCollision.y);
			direction = facing + 180;
			speed = moveSpeed;
		} else {
			speed = moveSpeed;
			mp_potential_step(obj_Player.x, obj_Player.y, speed, false);	
		}
		
	} else {
		speed = 0;
	}
}

if (speed != 0) {
	sprite_index = spr_Enemy_Small_Move;	
	
	if ((direction >= 0 && direction <= 90) or (direction >= 270 && direction < 360)) {
		image_xscale = 1;
	} else {
		image_xscale = -1;
	}
} else {
	sprite_index = spr_Enemy_Small_Idle;	
}