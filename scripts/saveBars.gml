/* Syntax: saveBars(fileName)

Arguments:
String fileName : The local (sandboxed) file name to save the bar data to.

Returns: FALSE if the bar data structure hasn't been initialized or loaded yet, TRUE otherwise.
*/
if (!ds_exists(global.barMap, ds_type_map)) {
    return false;
}

var f = file_text_open_write(argument0);
file_text_write_string(f, json_encode(global.barMap));
file_text_close(f);

return true;
