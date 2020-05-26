grounded = (place_meeting(x,y+1,oWall));

var _keyLeft = keyboard_check(ord("A"));
var _keyRight = keyboard_check(ord("D"));
var _keyUp = keyboard_check(ord("W"));
var _keyDown = keyboard_check(ord("S"));
var _keyJump = keyboard_check_pressed(vk_space);
var _keyDash = keyboard_check(ord("Q"));


switch (state)
{
	case pState.normal:
	{
		hSpeed = (_keyRight - _keyLeft) * walkSpeed;
		var dir = _keyRight - _keyLeft;
		hSpeed += dir * walkAcceleration * 8
		
		if (dir == 0) 
		{
			var hFriction = hFrictionGround;
			if (!grounded)  hFriction = hFrictionAir;
			hSpeed = Approach(hSpeed,0,hFriction);
		}
		hSpeed = clamp(hSpeed,-walkSpeed,walkSpeed);
		
		vSpeed += gravity_;

		if (_keyJump) && (grounded)
		{
			grounded = false;
			vSpeedFraction = 0;
			vSpeed = -jumpSpeed;
		}
		
		if (mouse_check_button_pressed(mb_left))
		{
			grappleX = oHook.x;
			grappleY = oHook.y;
			ropeX = x;
			ropeY = y;
			if(place_meeting(oHook.x,oHook.y,oWall))
			{
			ropeAngleVelocity = 0;
			ropeAngle = point_direction(grappleX,grappleY,x,y);
			ropeLength = point_distance(grappleX,grappleY,x,y);
			state = pState.swing;
			}
		}
		
		
	}break;
	
	case pState.swing:
	{

		var _ropeAngleAcceleration = -0.2 * dcos(ropeAngle);
		//_ropeAngleAcceleration += (_keyRight - _keyLeft) * 0.03;
		ropeLength += (_keyDown - _keyUp) * 2;
		ropeLength = max(ropeLength,0);

		
		ropeAngleVelocity += _ropeAngleAcceleration;
		ropeAngle += ropeAngleVelocity;
		//ropeAngleVelocity *= 0.99;
		
		ropeX = grappleX + lengthdir_x(ropeLength, ropeAngle);
		ropeY = grappleY + lengthdir_y(ropeLength, ropeAngle);
		
		hSpeed = ropeX - x;
		vSpeed = ropeY - y;
		
		if (_keyJump)
		{
			state = pState.normal;
			//vSpeedFraction = 0;
			vSpeed = -jumpSpeed;
		
		}
	}break;
}


	
hSpeed += hSpeedFraction;
vSpeed += vSpeedFraction;
hSpeedFraction = frac(hSpeed);
vSpeedFraction = frac(vSpeed);
hSpeed -= hSpeedFraction;
vSpeed -= vSpeedFraction;

if (place_meeting(x+hSpeed,y,oWall))
{
    var _hStep = sign(hSpeed);
    	hSpeed = 0;
    	hSpeedFraction = 0;
    while(!place_meeting(x+_hStep,y,oWall)) x += _hStep;	
    if (state == pState.swing)
    {
        		ropeAngle = point_direction(grappleX,grappleY,x,y);
        		ropeAngleVelocity = 0;
    }
}
x += hSpeed;

if (place_meeting(x,y+vSpeed,oWall))
{
    var _vStep = sign(vSpeed);
    	vSpeed = 0;
    	vSpeedFraction = 0;
    while(!place_meeting(x,y+_vStep,oWall)) y += _vStep;	
    if (state == pState.swing)
    {
        		ropeAngle = point_direction(grappleX,grappleY,x,y);
        		ropeAngleVelocity = 0;
    }
}
y += vSpeed;

