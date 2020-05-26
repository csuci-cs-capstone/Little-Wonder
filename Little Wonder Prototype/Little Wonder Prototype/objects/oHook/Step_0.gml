/// @description Insert description here
// You can write your code in this editor
y = target.y - lengthAway;
visible = true;
if(keyboard_check(ord("A")))
{
	x = target.x - lengthAway;
}
else if (keyboard_check(ord("D")))
{
	x = target.x + lengthAway;
}