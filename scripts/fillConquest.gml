/* Syntax: fillConquest(color, starting_node, collect)

Arguments:
int color : The color to fill (usually c_white for players and c_black for opponents)
instance starting_node : The node to start filling from
boolean collect : True = collect energy from the fill, false = don't collect energy

Returns: The number of nodes filled

Notes: This will alter the board!

*/
var num = 0, color = argument0, node = argument1, dir = node.node_angle, stack = ds_stack_create(), collect = argument2;
node.image_blend = c_white;
if (color == c_black) {
    node.sprite_index = SpriteConquestNodeBlack;
}

node = instance_position(node.x + lengthdir_x(node.sprite_width, dir), node.y + lengthdir_y(node.sprite_height, dir), ObjectConquestNode);

// Note: black nodes have an image_blend of c_white as well, for graphical reasons, making this easier!
if (instance_exists(node) && node.image_blend!=c_white) {
    ds_stack_push(stack, node);
}

while (!ds_stack_empty(stack)) {
    node = ds_stack_pop(stack);
    ++num;
    
    node.image_blend = c_white;
    if (color == c_black) {
        node.sprite_index = SpriteConquestNodeBlack;
    }
    if (collect) {
        with (node) {
            effect_create_above(ef_ring, x, y, 0, c_white);
            event_user(0);
        }
    }
    
    dir = node.node_angle;
    node = instance_position(node.x + lengthdir_x(node.sprite_width, dir), node.y + lengthdir_y(node.sprite_height, dir), ObjectConquestNode);
    
    // Note: black nodes have an image_blend of c_white as well, for graphical reasons, making this easier!
    if (instance_exists(node) && node.image_blend!=c_white) {
        ds_stack_push(stack, node);
    }
    
}

ds_stack_destroy(stack);
return num;
