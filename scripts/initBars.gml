/* Syntax: initBars()

Arguments:
(None)

Returns: Nothing.

Notes: Initializes the data structures used to hold bar data (i.e. colors, max amounts, and current fill amounts).
*/
global.barMap=ds_map_create();

// Red bar = Aggression (Roxie's specialty)
var aggroBar = ds_map_create();
ds_map_add_map(global.barMap, c_red, aggroBar);

// Blue bar = Intellect (George's specialty)
var intellectBar = ds_map_create();
ds_map_add_map(global.barMap, c_blue, intellectBar);

// Green bar = Concealment (Daisy's specialty)
var concealBar = ds_map_create();
ds_map_add_map(global.barMap, c_green, concealBar);

// Yellow bar = Confusion (Mason's specialty)
var confusionBar = ds_map_create();
ds_map_add_map(global.barMap, c_yellow, confusionBar);

// Orange bar = Leadership (Rube's specialty)
var leaderBar = ds_map_create();
ds_map_add_map(global.barMap, c_orange, leaderBar);

//  Purple bar = Courage (Betty's specialty)
var courageBar = ds_map_create();
ds_map_add_map(global.barMap, c_purple, courageBar);

/* Now, we initialize all the bars themselves */
var key = ds_map_find_first(global.barMap), val = undefined;
global.barColors = ds_list_create();
while (!is_undefined(key)) {
    val=ds_map_find_value(global.barMap, key);

    // Keep a list of possible colors for faster lookup and selection later    
    ds_list_add(global.barColors, key);
    
    ds_map_add(val, "Max", 100);
    ds_map_add(val, "Current", 0);
    
    key=ds_map_find_next(global.barMap, key);
}
