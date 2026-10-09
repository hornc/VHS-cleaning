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

// Extend handle
translate([0, 2*-handle, 0])
    cube([thickness, 40, h/5]);

// Rounded tip
translate([thickness/2, 20, 0])
    cylinder(h, d=thickness);

// Gripper thumb
translate([4,0,0]){
    cube([thickness, 7, h]);
    translate([thickness/2, 7, 0])
        cylinder(h, d=thickness);
}

// Gripper basal joint
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

// Gripper texture
module gripper_texture() {
    color("brown")
    for (i = [0 : 3]) {
        translate([0, i * thickness, 0])
            cylinder(h - 0.1, d=thickness);
    }
}

translate([thickness*2.2, 0.5, 0])
    gripper_texture();

translate([1.5, -0.5, 0])
    gripper_texture();
