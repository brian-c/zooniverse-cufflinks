$fn=50;

flat=false;

module logo() {
  radius=7.5;
  outer=2;
  center=2.5;
  thickness=1.5;

  union() {
    if (flat) {
      rotate_extrude() translate([radius-(outer/2), 0, 0]) square([outer, outer], center=true);
      cylinder(r=center, h=thickness, center=true);
    } else {
      rotate_extrude() translate([radius-(outer/2), 0, 0]) scale([1, 0.8]) rotate(45) square([outer, outer], center=true);
      sphere(r=center/1.2);
    }

    rotate(35) scale([17, 1.25, 1]) sphere(r=thickness/2);
  }
}

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
