include <config.scad>;

//0: open
//1: grid
//2: chimney
//3: closed
module rack_end(type){    
    width = sixinch+1; 
    difference(){
        union(){
            translate([1.25,1.25,1.25]){
                minkowski(){
                    w = width-2.5;            
                    cube([w, w, gauge-2.5]);                        
                    sphere(r=1.25);
                }
            }
        }
        if(type==0 || type==1){
            translate([20,20,-1]){ cube([width-40,width-40,gauge+2]);}  
        }
    
        translate([10,10,-0.1])                { cylinder(d=5,h=10); cylinder(d1=10,d2=6,h=3.5);}
        translate([width-10,10,-0.1])        { cylinder(d=5,h=10); cylinder(d1=10,d2=6,h=3.5);}
        translate([10,width-10,-0.1])        { cylinder(d=5,h=10); cylinder(d1=10,d2=6,h=3.5);}
        translate([width-10,width-10,-0.1]){ cylinder(d=5,h=10); cylinder(d1=10,d2=6,h=3.5);}  
  
        rotate([-90,0,0]){
            if(type==2){
                translate([0,-5,0]){chimney();}
                translate([0,-5,(width-29)/2]){chimney();}
                translate([0,-5,width-29]){chimney();}
            }
        }    
    }  
    if(type==1){
        intersection(){
            union(){
                sz=8;
                grid = 15;
                for(i=[-grid*8:12:grid*8]){        
                    translate([sz/2+i+70,sz/2+78,gauge/2]){
                        rotate([0,0,45]){
                        cube([2,width*1.5,gauge],center=true);        
                        }
                    }
                    translate([sz/2+i+70,sz/2+82,gauge/2]){
                        rotate([0,0,-45]){
                            cube([2,width*1.5,gauge],center=true);        
                        }
                    }
                }
            }
            translate([15,15,-1]){cube([125,125,10]);}
        }
    }    
}
rack_end(1);
