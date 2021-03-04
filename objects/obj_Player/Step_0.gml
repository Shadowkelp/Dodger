/// @description Insert description here
// You can write your code in this editor
var _right = keyboard_check(vk_right) or keyboard_check(ord("D"));
var _left = keyboard_check(vk_left) or keyboard_check(ord("A"));
var _up = keyboard_check(vk_up) or keyboard_check(ord("W"));
var _down = keyboard_check(vk_down) or keyboard_check(ord("S"));

var _inputX = _right - _left;
var _inputY = _down - _up;

moveX = _inputX * moveSpeed;
moveY = _inputY * moveSpeed;

//Collisions
if (collision(x + moveX, y)) {
	while (!collision(x + sign(moveX), y)) {
		x += sign(moveX);
	}
	moveX=0;	
}

if (collision(x, y + moveY)) {
	while (!collision(x, y + sign(moveY))) {
		y += sign(moveY);
	}
	moveY=0;	
}

x += moveX;
y += moveY;

//Animation
if (moveX != 0 or moveY != 0) {
	sprite_index = spr_Player_Move;	
} else {
	sprite_index = spr_Player_Idle;	
}

var _signMouse = sign(mouse_x -x);

if (_signMouse != 0) {
	image_xscale = _signMouse;	
}

if (moveX != 0 && sign(moveX) != _signMouse) {
	image_speed = -1;	
} else {
	image_speed = 1;
}