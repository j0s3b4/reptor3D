/********************/
/*   X gear rack    */
/*  Reptor project  */
/*  GPL (c) j0s3b4  */
/*    20140110	    */
/********************/

// Changelog
/*
    + First version
*/
rack_gear();

module rack_gear(){
  
  // Includes

  include <rack_gear.scad>;

  // Variables

  bolt_int_diam=3.5;
  bolt_ext_diam=6.5;
  bolt_head_height=3;
  hole_height=20;
  rack_long=100;
  hole_dist=10;


  // Program

  color("silver")
  // Gear rack
  difference(){
    // Gear rack
    // CP (mm/tooth), # teeth, width (mm), thickness(of base) (mm)
    translate([49.25,0,7.5]) rotate([270,0,0]) rack(5,20,20,15);
    // Holes
    for(i=[0:9])
	{
	  // slotted hole
	  rotate([90,0,0]) translate([((5+(i*hole_dist))-(bolt_int_diam/8)),7.5,-20.5]) cylinder(r=bolt_int_diam/2,h=hole_height+1,$fn=100);
	  rotate([90,0,0]) translate([((5+(i*hole_dist))+(bolt_int_diam/8)),7.5,-20.5]) cylinder(r=bolt_int_diam/2,h=hole_height+1,$fn=100);
	}
   
    // Groove for bolts head (avellanado)
    rotate([0,0,90]) translate([17.5,-rack_long-0.5,3.75]) cube([bolt_head_height,rack_long+1,7.5]);
    
    
    }
}  