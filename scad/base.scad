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
    cube([12, 9, 2.5 + clearance], center=true);
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
            translate([-base_dia/2, 0, 0]) 
                cube([lid_dia, hinge_depth, base_thi + base_hei]);
            translate([0, 0, base_thi]) cylinder(d=base_dia, h=base_hei);
            // latch knob support
            translate([0, -base_dia/2 + base_thi /2, latch_hole_hei])
                rotate([90, 0, 0]) cylinder(d=8, h=4, center=true);
        }
        // Center hole for motor (axle may stick out a bit)
        cylinder(d=9, h=base_thi);
        for(i = [0:90:270]) rotate([0, 0, i]) {
            // Motor mounting slits
            translate([6.5, 0, 0]) motor_hole();
            // Screw holes for suctions cups
            translate([40, 0, 0]) cylinder(d=4.2, h=base_thi);
        }
        translate([0, 0, base_thi])
            cylinder(d=base_dia - base_thi * 2, h=base_hei + 1);
        translate([ -lid_dia/2, hinge_depth - 13, base_hei/2])
            rotate([0, 90, 0]) barrel_jack_mount();
        translate([ -lid_dia/2, 45, (base_hei + base_thi)/2])
            rotate([0, 90, 0]) switch_hole();
        translate([ lid_dia/2, hinge_depth - 25, base_hei/2 + 1])
            rotate([0, 270, 0]) pot_hole();

        translate([0, hinge_depth - hinge_thi/2, base_hei + base_thi - 3])
            rotate([0, 90, 0]) base_hinge();
        translate([0, lid_dia/2, 15]) usb_hole();

        for(i=[-1,1])
            translate([i* 30, 30, base_hei/2 + base_thi])
                cube([40, 60, base_hei], center=true);
        // Latch hole
        translate([0, -base_dia/2 + base_thi /2, latch_hole_hei])
            rotate([90, 0, 0]) cylinder(d=4.2, h=10, center=true);
    }
}

