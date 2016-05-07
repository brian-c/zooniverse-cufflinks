$fn=48;

module logo(diameter=15) {
  radius=diameter/2;
  center=radius/3;
  outer=center/1.25;

  union() {
    rotate_extrude() translate([radius-(outer/2), 0, 0]) scale([1, 0.8]) rotate(45) square([outer, outer], center=true);
    sphere(r=center/1.2);
    rotate(35) scale([17, 1.25, 1]) sphere(r=center*0.3);
  }
}
