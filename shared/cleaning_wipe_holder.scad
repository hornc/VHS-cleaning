// Module: Basic cleaning wipe holder
// Repo: https://github.com/hornc/VHS-cleaning
// Author: hornc, 2026
// Version: v0.1
// License: CC BY-SA 4.0

cleaning_wipe_holder();

// Exported dimensions
function tape_width() = 12.7;


module cleaning_wipe_holder(base=2) {
    $fn = 64;
    post_h = 22;
    gap = 4.5;
    grip_depth = 8;
    tape_width = tape_width();

    // Main post
    difference(){
        cylinder(post_h + base, d=tape_width);
        translate([tape_width / -2, 2, -1])
            cube([tape_width + 5, tape_width, post_h + 5]);
    }
    // grip posts
    translate([2.25, 2 + 9, 0])
        cube([(tape_width - gap) / 2, grip_depth, post_h]);
    translate([1.85 - tape_width + gap, 2 + 9, 0])
        cube([(tape_width - gap) / 2, grip_depth, post_h]);
}