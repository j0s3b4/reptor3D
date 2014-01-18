/********************/ 
/*  Reptor project  */
/*     Union 	    */
/*  GPL (c) j0s3b4  */
/*    20140110      */
/********************/

// Changelog
/*
    + First version
*/

  
// Program
  
union();

// Modules

module union()
{

// Variables

  // union dimensions
  union_width=10;
  union_height=3;
  union_long=100;
  
  // M3 bolts
  M3_bolt_ext_diam=3.25;
  
  // others
  hole_dist=10;
  
  color("silver")
  difference()
  {
    cube([union_width,union_long,union_height]);
      for(i=[0:9])
      {
	translate([5,(5+(i*hole_dist)),-0.5]) cylinder(r=M3_bolt_ext_diam/2,h=union_height+1,$fn=100);
      }  
  }
}