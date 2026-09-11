// VHS tape cleaning PEC pad holder
// prototyping a basic holder
// Repo: https://github.com/hornc/VHS-cleaning
// Author: hornc, 2026
// Version: v0.2
// License: CC BY-SA 4.0

use <shared/cleaning_wipe_holder.scad>

$fn = 64;
base_h = 2;
dist = 22;  // distance between screw holes in base
tape_width = tape_width();

cleaning_wipe_holder(base_h=base_h);

// generic two hole base
difference(){
    minkowski(){ // rounded base
        translate([(tape_width - 4) / -2, 0, 0])
            cube([tape_width - 4, dist * 1.1, base_h]);
        cylinder(r=2, h=0.01, center=true);
    }
    group(){  // screw holes
        translate([0, 6.5, -1])
            cylinder(base_h * 2, d=3);
        translate([0, dist, -1])
            cylinder(base_h * 2, d=3);
    }
}