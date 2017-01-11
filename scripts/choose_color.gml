/* Syntax: choose_color()

Arguments:
(None)

Returns: A random color from the global color list.
*/
return ds_list_find_value(global.barColors, irandom(ds_list_size(global.barColors)-1));
