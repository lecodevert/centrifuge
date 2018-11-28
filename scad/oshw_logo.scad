// OSHW Logo Generator
/* An OpenSCAD implementation of the Open Source Hardware Logo. */
/* Tentatively licenses CC-By-SA, unless I hear otherwise. (I'm flexible. :) */
/* Taken from: https://github.com/clothbot/OSHW */

use_files=false;

module gear_tooth_2d(scale=1.0) {
    scale([scale,scale]) polygon(
            points=[ [0,25.0], [90.0,12.0], [90.0,-12.0], [0,-25.0] ]
            , paths=[ [0,1,2,3] ]
            );
}

module oshw_logo_2d(scale=1.0) {
    scale([scale,scale]) rotate(-45-90) {
        difference() {
            union() {
                circle(r=70.0);
                for(i=[1:7]) assign(rotAngle=360*i/8+45) rotate(rotAngle) {
                    gear_tooth_2d();
                }
            }
            circle(r=25.0);
            intersection() {
                rotate(-20) square(size=[100,100]);
                rotate(20)  square(size=[100,100]);
            }
        }
    }
}

module shell_2d(width=2.0,steps=8,scale_x=1.0,scale_y=1.0) {
    union() {
        for(i=[0:steps-1]) assign(rotAngle=360*i/steps) difference() {
            child(0);
            translate([scale_x*width*cos(rotAngle),scale_y*width*sin(rotAngle)]) 
                child(0);
        }
    }
}

module oshw_coin(scale=0.1, coin_h=10.0, coin_wall_th=4.0, extension=0.1) {
    scale([scale/200,scale/200,scale/200]) union() {
        difference() {
            cylinder(r=100.0,h=coin_h,center=false);
            translate([0,0,coin_wall_th])
                cylinder(r=100.0-coin_wall_th,h=coin_h-coin_wall_th+extension,center=false);
            translate([0,0,-extension])  linear_extrude(height=coin_wall_th/2+extension,center=false) 
                scale([(100.0-coin_wall_th)/100.0,(100.0-coin_wall_th)/100.0]) {
                    if(use_files) shell_2d(width=coin_wall_th,steps=32) import_dxf(file="static_files/oshw_logo_2d.dxf");
                    if(!use_files) shell_2d(width=coin_wall_th,steps=32) render() oshw_logo_2d(scale=1.0);
                }
        }
        translate([0,0,coin_wall_th]) color([0,0,1.0]) linear_extrude(height=(coin_h-coin_wall_th)/2,center=false)
            scale([(100.0-coin_wall_th)/100.0,(100.0-coin_wall_th)/100.0]) {
                if(use_files) import_dxf(file="static_files/oshw_logo_2d.dxf");
                if(!use_files) render() oshw_logo_2d(scale=1.0);
            }
        translate([0,0,coin_wall_th-extension]) color([0,0,0])
            linear_extrude(height=coin_h-coin_wall_th+extension,center=false) scale([(100.0-coin_wall_th)/100.0,(100.0-coin_wall_th)/100.0]) {
                if(use_files) shell_2d(width=coin_wall_th,steps=32) import_dxf(file="static_files/oshw_logo_2d.dxf");
                if(!use_files) shell_2d(width=coin_wall_th,steps=32) render() oshw_logo_2d(scale=1.0);
            }
    }
}
