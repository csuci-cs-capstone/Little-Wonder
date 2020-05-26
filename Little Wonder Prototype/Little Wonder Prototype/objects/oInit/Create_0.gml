/// @description Insert description here
// You can write your code in this editor
/// @description Game Setup
//Collision tiles
//Add all tiles to the screen
#macro TILE_SIZE 32
tiles = sprite_get_width(sCol) / TILE_SIZE
heightstoget = tiles * TILE_SIZE;


//Make Tile layer
var layerid = layer_create(0,"Tiles");
tilemapid = layer_tilemap_create(layerid,0,0,tColision,tiles,1);

//Create Tiles
var data
for (var i = 0; i <= tiles; i++)
{
	tilemap_set(tilemapid, i, i, 0);
	show_debug_message("Tile " + string(i) + " set");
}