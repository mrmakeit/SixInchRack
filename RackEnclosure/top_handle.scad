include <config.scad>;
module tophandle(){
    rotate([0,180,0]){
        difference(){
            union(){
                rotate([0,45,0]){
                    extrusion(4,false,false,false);
                }
                translate([sixinch,20,0]){
                    rotate([0,45,180]){
                        extrusion(4,false,false,false);
                    }
                }
            }    
            wedge();            
            translate([90,90,10]){
                cube([200,200,20],center=true);
            }       
            translate([10,10,0]){handlescrew();}
            translate([sixinch-10,10,0]){handlescrew();}        
        }
        intersection(){
            translate([0,0,-27.4]){
                extrusion(11,false,false,false);
            }
            wedge();        
        } 
    }    
}

tophandle();
