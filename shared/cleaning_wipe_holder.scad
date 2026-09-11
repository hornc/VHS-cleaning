// Module: Basic cleaning wipe holder
// Repo: https://github.com/hornc/VHS-cleaning
// Author: hornc, 2026
// Version: v0.1
// License: CC BY-SA 4.0

cleaning_wipe_holder();

module cleaning_wipe_holder( ) {
    $fn = 64;
    base = 2;
    post = 22;
    tape = 12.7;
    gap = 4.5;
    postdepth = 8;

    // Main post
    difference(){
        cylinder(post + base, d=tape);
        translate([tape / -2, 2, -1])
            cube([tape + 5, tape, post + 5]);
    }
    // grip posts
    translate([2.25, 2 + 9, 0])
        cube([(tape - gap) / 2, postdepth, post]);
    translate([1.85 -tape + gap, 2 + 9, 0])
        cube([(tape - gap) / 2, postdepth, post]);
}