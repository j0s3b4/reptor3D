/*********************
/*  Reptor project  */
/*      X Beam 	    */
/*  GPL (c) j0s3b4  */
/*     20140109	    */
/********************/

// Changelog
/*
    + First revision
*/

// Variables

  // external dimensions
  ext_width=40;  // external width of xbeam
  ext_height=70;  // external height of xbeam
  ext_long=100;  // long of xbeam
  
  // union groove dimensions
  union_groove_width=4;
  union_groove_height=11;
  union_groove_long=100;
  
  // rack groove dimensions
  rack_groove_width=4;
  rack_groove_height=21;
  rack_groove_long=100;
  
  
  // bolt M3
  bolt_diam=3.5;
  
  // nut M3
  nut_diam=6.5;
  nut_height=2.5;
  
  //others
  wall_thickness=10;
  hole_dist=10;

// Program

color("black")

 // for printing comment next line
  rotate([90,0,180]) translate([-ext_width,0,0])
difference()
{
  
  // exterior cube
  cube([ext_width,ext_height,ext_long]);
  
  // interior hole
  translate([wall_thickness,wall_thickness,-0.05]) cube([(ext_width-(2*10)),(ext_height-(2*10)),ext_long+1]);
  
  // octagon for union with floor
  rotate([90,0,0]) translate([ext_width/2,ext_long/2,-wall_thickness-0.5]) cylinder(r=15/2,h=(wall_thickness+1),$fn=8);
  
  // rack groove (ranura para la cremallera)
  
    // left hand down
    translate([ext_width-3,10,-0.5]) cube([rack_groove_width,rack_groove_height,(rack_groove_long+1)]);
  
  // union groove (ranura para la union)
  
    // left hand up
    translate([ext_width-3,ext_height-20,-0.5]) cube([union_groove_width,union_groove_height,(union_groove_long+1)]);
  
    // right hand down
    translate([-1,10,-0.5]) cube([union_groove_width,union_groove_height,union_groove_long+1]);
  
    // right hand up
    translate([-1,ext_height-20,-0.5]) cube([union_groove_width,union_groove_height,union_groove_long+1]);
  
  // holes for the bolts
    
    // down
    for(i=[0:10])
    {
      rotate([0,90,0]) translate([(-5-(i*hole_dist)),15,0]) cylinder(r=bolt_diam/2,h=ext_width,$fn=100);
    }
    
    // up
    for(i=[0:10])
    {
      rotate([0,90,0]) translate([(-5-(i*hole_dist)),55,0]) cylinder(r=bolt_diam/2,h=ext_width,$fn=100);
    }
    
  // nuts M3 holes
    
    // right down
    for(i=[0:10])
    {
      rotate([0,90,0]) translate([(-5-(i*hole_dist)),15,7]) cylinder(r=nut_diam/2,h=3.5,$fn=6);
    }
    
    // right up
    for(i=[0:10])
    {
      rotate([0,90,0]) translate([(-5-(i*hole_dist)),55,7]) cylinder(r=nut_diam/2,h=3.5,$fn=6);
    }
     
    // left down
    for(i=[0:10])
    {
      rotate([0,90,0]) translate([(-5-(i*hole_dist)),15,29.5]) cylinder(r=nut_diam/2,h=3.5,$fn=6);
    }
     
    // left up
    for(i=[0:10])
    {
      rotate([0,90,0]) translate([(-5-(i*hole_dist)),55,29.5]) cylinder(r=nut_diam/2,h=3.5,$fn=6);
    }
 
}