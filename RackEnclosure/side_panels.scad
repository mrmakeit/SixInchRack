include <config.scad>
module sidepanel(u,handle){
    difference(){
        baseplate(u);
        if(handle){
              translate([(sixinch-80)/2,         9,-4]) { cube([80,20,10]);}
              translate([(sixinch-80)/2,        19,-4]) { cylinder(d=20,h=10);}
              translate([sixinch-(sixinch-80)/2,19,-4]) { cylinder(d=20,h=10);}
        }
    }
}
Handles=true;
sidepanel(Units,Handles);
