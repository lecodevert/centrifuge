
module nut_trap(w = 5.5, h = 3) {
    cylinder(r = w/2/cos(180/6) + 0.05, h=h, $fn=6);
    translate([0, - w/2, 0]) cube([10, w, h]);
}

module motor_spacer() {
    difference() {
        cylinder(d=26, h=20);
        for(i=[45: 180: 270])
            rotate([0, 0, i]) {
                translate([9, 0, 14.5])
                    cylinder(d=3 + clearance, h=6);
                translate([9, 0, -1])
                    cylinder(d=6 + clearance, h=16);
            }
        for(i=[135: 180: 360])
            rotate([0, 0, i]) {
                translate([7.5, 0, 14.5])
                    cylinder(d=3 + clearance, h=6);
                translate([7.5, 0, -1])
                    cylinder(d=6 + clearance, h=16);
            }
        for(i=[0: 90: 270])
            rotate([0, 0, i]) {
                translate([10, 0, -0.5])
                    cylinder(d=3 + clearance, h=21);
                translate([10, 0, 10])
                    nut_trap(w = 5.5, h = 2.5);
            }
    }
}
