/* Syntax: fillBar(color, amount)

Arguments:
Real color : The color to fill.
Real amount : The amount to fill. May be negative to remove from the bar.

Returns: The total amount added or removed (as the value is clamped between 0 and the bar's
max, it may not be the same as the input amount). Returns NULL if the color is not
an actual bar color.
*/
var col = argument0, amt = argument1, actualAmt = 0, current = 0, new = 0, maxi = 0, map = NULL;

if (!ds_exists(global.barMap, ds_type_map) || !ds_map_exists(global.barMap, col)) {
    return NULL;
}

map = ds_map_find_value(global.barMap, col);

if (!ds_exists(map, ds_type_map)) {
    return NULL;
}

current = ds_map_find_value(map, "Current");
maxi = ds_map_find_value(map, "Max");
new = clamp(current + amt, 0, maxi);
actualAmt = current - new;
ds_map_replace(map, "Current", new);

return actualAmt;
