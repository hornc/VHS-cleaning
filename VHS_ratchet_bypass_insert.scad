// VHS-cleaning: Ratchet Bypass Insert
// Repo: https://github.com/hornc/VHS-cleaning
// Author: hornc, 2026
// Version: v0.4
// License: CC BY-SA 4.0

$fa = 1;    // Minimum angle per fragment in degrees
$fs = 0.1;  // Minimum length of each fragment in mm 

post_r = 3;

LONG = 22;  // full length of clutch, 5 screw version
SHORT = 16; // shorter length to accomodate 6 screw versions
length = LONG;


cylinder(10, post_r, post_r);

difference(){
    translate([(post_r-length)/2 + 1, 0, 5]) {
        cube([length - (post_r), 12, 10], center=true);
        translate([(post_r-length)/2, -6, 5]){
            difference(){
                cube([8, 12, 8]);
                rotate([90, 0, 0])
                    translate([8, 9, -15])
                    cylinder(20, d=18);
            }
        }
    }
    union(){
        translate([21.7, 45, -4])
            cylinder(20, d=94);
        translate([21.7, -45, -4])
            cylinder(20, d=94);
    }
}

translate([-length + post_r, -6, 0]) {
    cube([2, 12, 15]);          // vertical back
    translate([1.5, 0, 15])
        rotate([-90, 0, 0])
            cylinder(12, d=3);  // rounded grip
}
