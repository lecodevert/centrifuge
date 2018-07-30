inner_dia = 100;

base_hei = 20;
base_thi = 3;
base_dia = inner_dia + 2 * base_thi;

lid_wall_thi = 3;
lid_dia = inner_dia + 2 * lid_wall_thi;
lid_height = 50;

hinge_rad = 10;
hinge_depth = 75;
hinge_thi = 5;


$fn = 100;

module motor_hole() {
    hull() {
        cylinder(d=3, h=base_thi);
        translate([10, 0, 0]) cylinder(d=3.5, h=base_thi);
    }
}

module pot_hole() {
    translate([0, 0, -5]) cylinder(d=7.5, h=15);
    translate([7.8, 0, 0]) cube([2, 3, 10], center=true);
}

module usb_hole() {
    cube([12, 9, 2.5], center=true);
}

module barrel_jack_mount() {
    difference() {
        union() {
            /* clearance */
            translate([0, 0, -3]) cylinder(d=7, h=3);
            cylinder(d=7, h=3);
            translate([0, 0, 13.5]) {
                cube([13, 11, 22], center=true);
                /* clearance */
                translate([0, -10, 0]) cube([13, 11, 22], center=true);
                translate([0, 0, 22 - 11.5/2]) {
                    cube([15, 12, 11.5], center=true);
                    /* clearance */
                    translate([0, -10, 0]) cube([15, 12, 11.5], center=true);
                    translate([0, 0, 11.5 - 4]) {
                        cube([11, 12, 4], center=true);
                        /* clearance */
                        translate([0, 0, 21]) cube([11, 12, 40], center=true);
                    }
                }
            }
        }
        /* breakable walls */
        translate([0, -5, 24]) cube([15, 22, 0.2], center=true);
        translate([0, -5, 35.5]) cube([15, 22, 0.2], center=true);
    }
}

module switch_hole() {
    cube([20, 12.2, 20], center=true);
}

module base_hinge() {
    cylinder(d=10, h=40, center=true);
    cylinder(d=3.2, h=lid_dia + 1, center=true);
}

module base() {
    difference() {
        union() {
            cylinder(d=base_dia, h=base_thi);
            translate([-base_dia/2, 0, 0]) cube([lid_dia, hinge_depth, base_thi + base_hei]);
            translate([0, 0, base_thi]) cylinder(d=base_dia, h=base_hei);
            translate([0, -base_dia/2 + base_thi /2, 15]) rotate([90, 0, 0]) cylinder(d=8, h=4, center=true);
        }
        // Center hole for motor (axle may stick out a bit)
        cylinder(d=9, h=base_thi);
        for(i = [0:90:270]) rotate([0, 0, i]) {
            // Motor mounting slits
            translate([6.5, 0, 0]) motor_hole();
            // Screw holes for suctions cups
            translate([40, 0, 0]) cylinder(d=4.2, h=base_thi);
        }
        translate([0, 0, base_thi]) cylinder(d=base_dia - base_thi * 2, h=base_hei + 1);
        translate([ -lid_dia/2, hinge_depth - 13, base_hei/2]) rotate([0, 90, 0]) barrel_jack_mount();
        translate([ -lid_dia/2, 45, (base_hei + base_thi)/2]) rotate([0, 90, 0]) switch_hole();
        /* translate([ 23, 38, base_thi]) cube([25, 30, base_hei - base_thi]); */
        translate([ lid_dia/2, hinge_depth - 25, base_hei/2 + 1]) rotate([0, 270, 0]) pot_hole();

        translate([0, hinge_depth - hinge_thi/2, base_hei + base_thi - 3]) rotate([0, 90, 0]) base_hinge();
        translate([0, lid_dia/2, 15]) usb_hole();
        for(i=[-1,1]) {
            translate([i* 30, 30, base_hei/2 + base_thi]) cube([40, 60, base_hei], center=true);
        }
        // Latch hole
        translate([0, -base_dia/2 + base_thi /2, 15]) rotate([90, 0, 0]) cylinder(d=4.2, h=10, center=true);
    }
}

module latch_hook() {
    translate([0, -2.5, 0]) {
        difference() {
            cube([10, 5, 2], center=true);
            translate([0, 1, 0]) cube([6, 3, 2], center=true);
        }
        translate([-5, -2.5, 0]) linear_extrude(height=2, center=true) polygon(points=[[0,0], [0, 5], [-5, 5]]);
    }
}


module lid() {
    difference() {
        union() {
            cylinder(d=lid_dia, h=lid_height);
            translate([-lid_dia/2, 0, hinge_rad]) cube([lid_dia, hinge_depth, lid_height - hinge_rad]);
            translate([0, hinge_depth -hinge_rad, hinge_rad]) rotate([0, 90, 0]) cylinder(r=hinge_rad, h=lid_dia, center=true);
            translate([-lid_dia/2, 0, 0]) cube([lid_dia, hinge_depth - hinge_rad, hinge_rad * 2]);
            translate([0, hinge_depth - hinge_thi/2, 3]) cube([39, hinge_thi, 12], center=true);
            translate([0, hinge_depth - hinge_thi/2, -3.25]) rotate([0, 90, 0]) cylinder(d=hinge_thi, h=39, center=true);
            translate([0, -lid_dia/2, 5]) rotate([0, 90, 0]) latch_hook();
        }
        translate([0, 0, 0]) cylinder(d=lid_dia - lid_wall_thi, h=lid_height - lid_wall_thi);
        translate([0, 0, 0]) cylinder(d=lid_dia - 8, h=lid_height);
        translate([0, hinge_depth - hinge_thi/2, -3.25]) rotate([0, 90, 0]) cylinder(d=3.2, h=100, center=true);
        translate([0, lid_dia/2 + 9, lid_height/2]) cube([inner_dia, 20, lid_height - 6], center=true);
    }
}

module latch() {
    difference() {
        union() {
            cylinder(d=10, h=2);
            translate([0, 1, 0]) cube([15, 4, 2]);
            translate([9.5, -2, 0]) cube([5.5, 4, 2]);
        }
        cylinder(d=4.2, h=2);
            translate([9.5, -1, 0]) cube([0.5, 2, 2]);
    }
}

base();
translate([0, 0, base_hei + base_thi]) lid();
translate([0, -base_dia/2 + base_thi /2 -2, 15]) rotate([90, 270, 0]) latch();

