/* Syntax: loadBars(fileName)

Arguments:
String fileName : The local (sandboxed) file name to load the bar data from.

Returns: False if the file can't be found or doesn't contain parsable data; true otherwise.

On failure, it will not alter any bar data that's already been loaded or initialized;
it's safe to call in any case.

On success, this will automatically free any previous memory used for the bars, then load
the bar data from the file into memory. Thus, you do not have to worry about cleaning up
bar data in memory before calling loadBars().
*/

if (!file_exists(argument0)) {
    return false;
}

var f = file_text_open_read(argument0), json="";
while (!file_text_eof(f)) {
   json+=file_text_read_string(f);
   file_text_readln(f); 
}
file_text_close(f);

var map = json_decode(json);
if (map == -1) {
    return false;
}
else {
    if (ds_exists(global.barMap, ds_type_map)) {
        ds_map_destroy(global.barMap);
    }
    
    global.barMap = map;
    
    // Create the list of possible bar colors for faster lookup/selection later
    if (ds_exists(global.barColors, ds_type_list)) {
        ds_list_destroy(global.barColors);
    }
    global.barColors = ds_list_create();
    var key=ds_map_find_first(global.barMap);
    while (!is_undefined(key)) {
        ds_list_add(global.barColors, key);
        key=ds_map_find_next(global.barMap, key);
    }
    
    return true;
}
