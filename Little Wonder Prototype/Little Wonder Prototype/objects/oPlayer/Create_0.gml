hSpeed = 0;
vSpeed = 0;
walkSpeed = 3;
walkAcceleration = 1.5;
hFrictionGround = 0.5;
hFrictionAir = 0;
jumpSpeed = 6;
gravity_ = 0.2;
hSpeedFraction = 0.0;
vSpeedFraction = 0.0;
state = pState.normal;


dashTime = 10;
dashing = false;
dash_cooldown = 0;
dash_speed = 5;
last_pressed = 0;

enum pState
{
    	normal,
    	swing
}

healthPoints = 50;
maxHP = healthPoints;

