// VHS-cleaning: Take-Up reel roller clamp
// Repo: https://github.com/hornc/VHS-cleaning
// Author: hornc, 2026
// Version: v0.2
// License: CC BY-SA 4.0

$fn = 64;
base_h = 2;
hole_d = 2.7;
e = 0.1;

module sloped_box(w, l, h1, h2) {  
    rotate([90, 0, 90])
    linear_extrude(height = w) {
        polygon(points=[
            [0, 0],
            [l, 0],
            [l, h2],
            [0, h1]
        ]);
    }
}


// bar with hole
difference(){
    group(){
        cube([30 + e, base_h, 5]);
        translate([-1, 0, 2.5])
        rotate([-90, 0, 0])
            cylinder(base_h, d=5);  // curved end
        translate([-1, 0, 0])
            cube([5, base_h, 5]);
    }
    // Hole
    translate([0, 0, 5/2])
        rotate([90, 0, 0])
            color("red")
                cylinder(10, d=hole_d, center = true);
}

under_len = 5;
edge_h = 20 + 1;  // +1 clearance

color("green")
translate([30, 0, 0])
    sloped_box(base_h, edge_h + base_h + e, 5, 10);

translate([30 - under_len, edge_h + base_h, 0])
    cube([under_len + base_h, base_h, 10]);
