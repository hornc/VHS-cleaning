// VHS tape cleaning PEC pad holder
// prototyping a basic holder
// Repo: https://github.com/hornc/VHS-cleaning
// Author: hornc, 2026
// Version: v0.1
// License: CC BY-SA 4.0


$fn = 64;
base = 2;
post = 22;
tape = 12.7;
gap = 4.5;
postdepth = 8;

difference(){
    cylinder(post + base, d=tape);
    translate([tape / -2, 2, -1])
        cube([tape + 5, tape, post + 5]);
}


// base
difference(){
    minkowski(){ // rounded base
        translate([(tape - 4) / -2, 0, 0])
            cube([tape-4, post * 1.1, base]);
        cylinder(r=2, h=0.01, center=true, $fn=32);
    }
    group(){  // screw holes
        translate([0, 6.5, -1])
            cylinder(base * 2, d=3);
        translate([0, 22, -1])
            cylinder(base * 2, d=3);
    }
}


// grip posts
translate([2.25, 2 + 9, 0])
    cube([(tape - gap)/2, postdepth, post]);
translate([1.85 -tape+gap, 2 + 9, 0])
    cube([(tape - gap)/2, postdepth, post]);
