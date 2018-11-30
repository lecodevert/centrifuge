// Global Parameters
$fn = 100;
clearance = 0.1;

// Base
inner_dia = 100; // Inside diameter of the main chamber
base_hei = 20;
base_thi = 3;
base_dia = inner_dia + 2 * base_thi;
total_base_hei = base_hei + base_thi;

hinge_rad = 10;
hinge_depth = 75;
hinge_thi = 5;

// Latch
knob_hei = 10;
knob_dia = 20;
latch_hook_thi = 2;
latch_hole_hei = 19;

// Lid
lid_wall_thi = 3;
lid_dia = inner_dia + 2 * lid_wall_thi;
lid_height = 50;

// Rotor
rotor_shaft_dia = 5;
axis_radius = rotor_shaft_dia/2 + clearance; // radius of the motor shaft

tube_radius = 5.75; // inner radius of the tube holders
tube_angle = 45; // angle in the rotor
tube_pos = 47.5; // position of tube holders

text1 = "Physique sans";
text2 = "Frontières";
font = "Liberation Sans:style=Bold";
