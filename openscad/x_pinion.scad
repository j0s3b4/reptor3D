// Gear pinion
// GPL v3
// j0s3b4

// Include
include <rack_gear.scad>;

// Variables
M3_nut_diam=3.25;

// Program

// Call to pinion module
pinion(5,20,10,5.5);

difference(){
  // Cylinder for the shaft fastener
  translate([0,0,10])cylinder(r=22/2,h=10,$fn=50);
  // Hole fot motor shaft
  cylinder(r=5.5/2,h=200,$fn=50);
  // Space for nut allocation
  translate([5,0,15]) cube([3,6,12.5],center=true);
  // Hole for bolt fasten shaft (chaveta)
  translate([0,0,15]) rotate([0,90,0]) cylinder(r=M3_nut_diam/2,h=25/2);
}