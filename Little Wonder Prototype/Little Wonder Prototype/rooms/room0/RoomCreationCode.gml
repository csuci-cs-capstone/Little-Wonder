var back = layer_background_get_id("Background");
layer_background_xscale(back, 64);
layer_background_yscale(back, 64);
layer_background_stretch(back,false);
layer_vspeed("Background", -0.25);
layer_hspeed("Background", -0.5);

enum e_state
{
	idle,
	chase
}
