/// @description Update Camera
// You can write your code in this editor

//Update destination
if (instance_exists(oPlayer))
{
	xTo = follow.x;
	yTo = follow.y - 25;
}

//Update object position
x += (xTo - x) ;
y += (yTo - y) ;



//Update camera view
camera_set_view_pos(cam,x-view_w_half,y-view_h_half);
