/* Syntax: rescale_application_surface(base_w, base_h)

Arguments:
Real base_w, Real base_h : The room's base dimensions (or main view's) without rescaling

Returns: Nothing

Notes: Rescales the application surface based on device resolution
 */
var base_w = argument0, base_h = argument1, aspect = base_w / base_h, ww = base_w, hh = base_h;
if (display_get_width() < display_get_height()) {
    // Portrait mode
    ww = min(base_w, display_get_width());
    hh = ww / aspect;
}
else {
    // Landscape mode
    hh = min(base_h, display_get_height());
    ww = hh * aspect;
}
surface_resize(application_surface, ww, hh);
