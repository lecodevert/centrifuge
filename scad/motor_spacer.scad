module nut_trap(w = 5.5, h = 3) {
    cylinder(r = w/2/cos(180/6) + 0.05, h=h, $fn=6);
    translate([0, - w/2, 0]) cube([10, w, h]);
}

// Made to mount motors with m3 holes spaced 16mm and 19mm in each direction
module motor_spacer(h = 20, mount = "universal") {
    difference() {
        cylinder(d=26, h=h);
        for(i=[45: 180: 270])
            rotate([0, 0, i]) {
                translate([19/2, 0, h - 5.5])
                    cylinder(d=3 + clearance*2, h=6);
                translate([19/2, 0, -1])
                    cylinder(d=6 + clearance, h=h-4);
            }
        for(i=[135: 180: 360])
            rotate([0, 0, i]) {
                translate([16/2, 0, h - 5.5])
                    cylinder(d=3 + clearance*2, h=6);
                translate([16/2, 0, -1])
                    cylinder(d=6 + clearance, h=h-4);
            }
        if (mount == "universal") {
            for(i=[0: 90: 270])
                rotate([0, 0, i]) {
                    translate([10, 0, -0.5])
                        cylinder(d=3 + clearance, h=h+1);
                    translate([10, 0, 5])
                        nut_trap(w = 5.5, h = 3 + clearance*2);
                }
        }
    }
}
