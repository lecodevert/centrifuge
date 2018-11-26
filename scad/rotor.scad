module rotor() {
    difference () { // substract tube holders from outer ring
        difference () { // substract inner groove
            difference() { // substract cone from main disk
                union() {
                    cylinder (h = 12.5, r=37.5); // main disk part 1
                    cylinder (h = 19, r=32.5); // main disk part 2

                    // smoothen edge torus
                    translate([0,0,12.5])
                        rotate_extrude(convexity = 10)
                        translate([30, 0, 0])
                        circle(r = 7.5);
                }

                translate([0,0,10]) // raise cone from bottom
                    cylinder (h = 11, r1 = 16.5, r2 = 30, center = false);

                translate([0,0,-1])
                    cylinder (h = 12, r=axis_radius); // axis

            }

            // groove under tube holders
            translate([0,0,8])
                difference() { // ring
                    cylinder (h = 2.5, r = 16.5); // outside ring
                    translate([0,0,-5]) {
                        cylinder (h = 13, r = 13); // inside ring
                    }
                }
        }

        //tube holding cylinders
        for(i = [0: 1: 7]) rotate([0, 0, i * 45])
            translate([-1 * tube_pos,0,-10])
                rotate([0, tube_angle, 0])
                    cylinder(h=80, r=tube_radius);
        // Numbering
        for(i=[1: 1: 8]) {
            rotate([0, 0, -i*45])
            translate([0, 30, 19])
              linear_extrude(height=2)
                  text(str(i), halign="center", size=4);
        }
    }
}
