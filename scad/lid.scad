module latch_hook() {
    translate([0, -2.5, 0]) {
        difference() {
            cube([10, 5, 4], center=true);
            translate([0, 1, 0]) cube([6, 3, 4], center=true);
        }
        translate([-5, -2.5, 0])
            linear_extrude(height=4, center=true)
                polygon(points=[[0,0], [0, 5], [-5, 5]]);
    }
}

module lid() {
    difference() {
        union() {
            cylinder(d=lid_dia, h=lid_height);
            translate([-lid_dia/2, 0, hinge_rad])
                cube([lid_dia, hinge_depth, lid_height - hinge_rad]);
            translate([0, hinge_depth -hinge_rad, hinge_rad])
                rotate([0, 90, 0])
                    cylinder(r=hinge_rad, h=lid_dia, center=true);
            translate([-lid_dia/2, 0, 0])
                cube([lid_dia, hinge_depth - hinge_rad, hinge_rad * 2]);
            translate([0, hinge_depth - hinge_thi/2, 3])
                cube([39, hinge_thi, 12], center=true);
            translate([0, hinge_depth - hinge_thi/2, -3.25])
                rotate([0, 90, 0]) cylinder(d=hinge_thi, h=39, center=true);
            translate([0, -lid_dia/2, 5]) rotate([0, 90, 0]) latch_hook();
        }
        translate([0, lid_dia/2 + 11, lid_height])
            linear_extrude(height=1)
                text(text1, size=8, halign="center");
        translate([0, lid_dia/2, lid_height])
            linear_extrude(height=1)
                text(text2, size=8, halign="center");
        translate([0, 0, -0.5])
            cylinder(d=lid_dia - lid_wall_thi, h=lid_height - lid_wall_thi + 1);
        translate([0, 0, -0.5])
            cylinder(d=lid_dia - 8, h=lid_height + 1);
        translate([0, hinge_depth - hinge_thi/2, -3.25])
            rotate([0, 90, 0])
                cylinder(d=3.2, h=100, center=true);
        translate([0, lid_dia/2 + 9, lid_height/2])
            cube([inner_dia, 20, lid_height - 6], center=true);
    }
}
