include <motor_spacer.scad>;
include <base.scad>;
include <config.scad>;
include <latch.scad>;
include <lid.scad>;
include <rotor.scad>;

draw_complete = 1;
draw_base_universal = 0;
draw_base_small_motor = 0;
draw_lid_window = 0;
draw_lid_no_window = 0;
draw_latch = 0;
draw_rotor = 0;
draw_motor_spacer = 0;

if (draw_complete == 1) {
    color("white") base();
    color("green") translate([0, 0, 40]) rotor();
    color("gray") translate([0, 0, base_hei + base_thi]) lid();
    color("red") translate([0, -base_dia/2 + base_thi /2 -2, latch_hole_hei])
        rotate([90, 90, 0]) latch();
}
else if (draw_lid_window == 1) rotate([0, 180, 0]) lid();
else if (draw_lid_no_window == 1) rotate([0, 180, 0]) lid(false);
else if (draw_base_small_motor == 1) base(mount="small");
else if (draw_base_universal == 1) base(mount="universal");
else if (draw_latch == 1) latch();
else if (draw_rotor ==1) rotor();
else if (draw_motor_spacer ==1) rotate([0, 180, 0]) motor_spacer();
