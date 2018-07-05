//=========== Get player input=============
key_left = (keyboard_check(ord("A")));
key_right = (keyboard_check(ord("D")));
key_jump = (keyboard_check_pressed(vk_space));

//=======Calculate Movement===========================
var  move = key_right - key_left;
hsp = move * walksp;
vsp = vsp + grv;
if (place_meeting(x,y+1,obj_wood_wall)) && (key_jump)
{
	vsp = -7;
}

//======Horizontal Collision====================
if(place_meeting(x+hsp,y,obj_wood_wall))
{	
	while(!place_meeting(x+sign(hsp),y,obj_wood_wall))
	{
		x = x + sign(hsp);
	}
	hsp = 0;
}
x = x + hsp;

//======Vertical Collision============================
if(place_meeting(x,y+vsp,obj_wood_wall))
{	
	while(!place_meeting(x,y+sign(vsp),obj_wood_wall))
	{
		y = y + sign(vsp)	
	}
	vsp = 0;
}
y = y + vsp;

//============Animation====================
if (!place_meeting(x,y+1,obj_wood_wall))
{
	sprite_index = spr_playerD_jump;
	image_speed = 0;
	if (sign(vsp) > 0) image_index = 1; else image_index = 0;
	
}