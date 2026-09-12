// VHS tape cleaning cassette insert
// Repo: https://github.com/hornc/VHS-cleaning
// Author: hornc, 2026
// Version: v0.3
// License: CC BY-SA 4.0
$fn = 64;

use <shared/cleaning_wipe_holder.scad>

tape_width = tape_width();
base_h = 2;


rotate([0, 0, -25])
    cleaning_wipe_holder(base_h=2, base=true);

rotate([0, 0, 180])
    translate([25, 3 * tape_width / 4, 0])
        difference() {
            cleaning_wipe_holder(base_h=base_h, base=true);
            translate([-7, 15.5, 1.9])
                color("red")
                rotate([0,0,-5])
                cube([5, 5, 30]);
        }

translate([-31.3, -28.5, 0]) {
    color("green", 0.5)
        cube([27, 15, 2], center=false);

    // thin post
    translate([-(8 + 3 + 1.5), 15 - 1.5 - 3, 0]){
        cylinder(10, d=3);
        translate([0, 0, 10])
            sphere(d=3);
    }
    
    // thick post
    color("yellow", 0.4)
    translate([20, -8, 0]){
        cylinder(7, d=11.5);
        translate([0, 0, 7])
            sphere(d=11.5);
    }
}

// Base
curve = 4;
bar_l = 40 - 6;

color("blue", 0.7)
minkowski() {
    group(){
        // Thick post base
        rotate([0, 0, -20])
            translate([-tape_width / 2 + curve, -bar_l, 0])
                cube([tape_width - 2 * curve, bar_l, base_h]);
        // Thin post base
            translate([-12, -35, 0])
            rotate([0, 0, 90 - 18])
                cube([tape_width - 2 * curve, bar_l, base_h]);
    }
    cylinder(r=curve, h=0.001, center=true);
}