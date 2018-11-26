include <base.scad>;
include <config.scad>;
include <latch.scad>;
include <lid.scad>;
include <rotor.scad>;

draw_complete = 1;
draw_base = 0;
draw_lid = 0;
draw_latch = 0;
draw_rotor = 0;

if (draw_complete == 1) {
    color("white") base();
    color("green") translate([0, 0, 40]) rotor();
    color("gray") translate([0, 0, base_hei + base_thi]) lid();
    color("red") translate([0, -base_dia/2 + base_thi /2 -2, latch_hole_hei])
        rotate([90, 90, 0]) latch();
}

if (draw_lid == 1) rotate([0, 180, 0]) lid();
if (draw_base == 1) base();
if (draw_latch == 1) latch();
if (draw_rotor ==1) rotor();
