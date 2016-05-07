$fn=24;

use <logo.scad>;

module back() {
  thickness=1.5;
  post_length=10;
  bar_length=16;
  bar_squash=2/3;

  union() {
    translate([0, 0, post_length/-2]) {
      cylinder(r1=thickness, r2=thickness/1.5, h=post_length, center=true);
      translate([0, 0, post_length/-2]) scale([1, 1, bar_squash]) {
        rotate([0, 90, 0]) cylinder(r=thickness, h=bar_length-thickness, center=true);
        translate([(bar_length-thickness)/2, 0, 0]) sphere(r=thickness);
        translate([(bar_length-thickness)/-2, 0, 0]) sphere(r=thickness);
      }
    }
  }
}

module cufflink() {
  union() {
    rotate([20, 0, 0]) logo();
    back();
  }
}

union() {
  translate([11, 0, 0]) cufflink();
  translate([-11, 0, 0]) cufflink();
}
