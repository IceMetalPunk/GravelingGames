/* Syntax: loadOrInitBars(fileName)

Arguments:
String fileName : The local file name to load the bar data from.

Returns: Nothing.

Notes: This is a very simple wrapper to attempt loading bar data from the given file and, if
that fails, to initialize new bar data. This ensures bar data exists for code to work with
later.
*/
if (!loadBars(argument0)) {
    initBars();
}
