module latch() {
    difference() {
        cylinder(d=knob_dia, h=knob_hei);
        cylinder(d=4 + clearance, h=knob_hei);
        translate([0, 0, knob_hei - 4])
            cylinder(d=7 + clearance, h=4.1);
        translate([ -5 - (total_base_hei - latch_hole_hei), 0, 0])
            rotate([-90, 0, 0]) scale([1.1, 1.1, 1.1]) latch_hook();
        translate([ - 5 - (total_base_hei - latch_hole_hei), - 6, 2.5])
            cube([10, 10, 5], center=true);
        // quick and dirty knurling on the knob part for better grip
        for(i = [0 : 18 : 360]) rotate([0, 0, i])
            translate([knob_dia/2, 0, knob_hei/2 + latch_hook_thi])
                cube([1, 1, knob_hei], center=true);
    }
}
