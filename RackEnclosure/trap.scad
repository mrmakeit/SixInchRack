include <config.scad>;
// Nut-less Trap
module trap(u){
    difference(){
        union(){
            translate([-2.4,0,4]){
                cube([4.8,unit*u,1.5]);
            }    
            translate([-2.4,unit*u,0]){
                rotate([90,0,0]){
                    linear_extrude(unit*u){
                        polygon(points=[[0,0],[4.8,0],[7,4],[-2.2,4]]);
                    }
                }
            }
        }                        
        for(i=[1:u]){
            translate([0,unit*i-unit/2,-1]){
                cylinder(d=Four_mm_screw,h=10);
            }                       
        }
    }
}

trap(Units);
