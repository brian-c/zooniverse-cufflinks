include <./logo.scad>;

difference() {
  union() {
    difference() {
      logo(60);
      rotate_extrude() translate([26, 0]) scale([1, 0.8]) rotate(45) square([5, 5], center=true);
      sphere(r=6);
    }
    rotate([0, 90, 35]) cylinder(r=1.5, h=65, center=true);
  }
  translate([0, 0, -5]) cylinder(r=60, h=10, center=true);
}
