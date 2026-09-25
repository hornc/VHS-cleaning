// Gripper for flat folded PEC pad
// to wipe top and bottom edges
// of tape.


$fn = 64;
handle = 35;
thickness = 2;
h = 20;


// Base + handle
difference() {
    translate([0, -handle, 0])
        cube([thickness, 20+handle, h]);
    translate([0, -33, 35])
        rotate([0, 90, 0])
            cylinder(8, d=62, center=true);
}

translate([thickness/2, 20, 0])
    cylinder(h, d=thickness);


translate([4,0,0]){
    cube([thickness, 7, h]);
    translate([thickness/2, 7, 0])
        cylinder(h, d=thickness);
}




translate([0, -3*thickness, 0]) {
    difference(){
        cube([thickness*3, thickness*3, h]);
        group(){
            translate([4*thickness, -1, -1]){
                cylinder(h*1.4, d=6*thickness);
            translate([-5, 7, 0])
                cylinder(h*2, d=thickness);
            }
        }
    }
}

// Grippers
translate([thickness*2.1, 0.5, 0]){
    cylinder(h, d=thickness);
    translate([0, thickness, 0])
        cylinder(h, d=thickness);
    translate([0, 2*thickness, 0])
        cylinder(h, d=thickness);
    translate([0, 3*thickness, 0])
        cylinder(h, d=thickness);
}