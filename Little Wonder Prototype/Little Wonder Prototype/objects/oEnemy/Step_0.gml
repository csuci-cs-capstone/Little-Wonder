/// @description Insert description here
// You can write your code in this editor
switch (state)
{
	case e_state.idle:
		hsp = 0;
		vsp = (min(7,vsp+0.05));
		if (distance_to_object(oPlayer) < 96)
		{
			state = e_state.chase;
		}
	break;
	case e_state.chase:
		dir = sign(oPlayer.x-x);
		hsp = dir*2;
		vsp = (min(7,vsp+0.05));
		if (distance_to_object(oPlayer) > 128)
		{
			state = e_state.idle;
		}
	break;
}

//Horizontal Colision
if(place_meeting(round(x+hsp),round(y),oWall))
{
	while(!place_meeting(round(x+sign(hsp)),round(y),oWall))
	{
		x += sign(hsp);
	}
	hsp = 0;
}
x += hsp;

//Vertical Colision
if(place_meeting(round(x),round(y+vsp),oWall))
{
	while(!place_meeting(round(x),round(y+sign(vsp)),oWall))
	{
		y += sign(vsp);
	}
	vsp = 0;
}
y += vsp;