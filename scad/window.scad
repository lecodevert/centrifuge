include <oshw_logo.scad>;

module window(){
    window_dia = inner_dia + 2;
    echo("Diameter of the window: ", window_dia);
    difference() {
        circle(d=window_dia);
        oshw_logo_2d(0.50);
    }
}
