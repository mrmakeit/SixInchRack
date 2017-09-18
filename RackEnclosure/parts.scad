module chimney() {    
    for(i=[0:8:80]){
        echo(i);
        translate([20 + (width-80)/2  +i,-1,20]){
            minkowski(){
                cube([0.01,50,30]);    
                sphere(d=2,h=1);        
            }
        }
    }
}


module handlescrew(){
    translate([0,0,-39]){cylinder(d=5,h=40); }
    translate([0,0,-4]){cylinder(d1=10,d2=6,h=3.5);}
    translate([0,0,-34]){cylinder(d=10,h=30);}
}

module wedge(){
    translate([sixinch/2,-10,15]){
        rotate([0,45+45/2,0]){
            cube([80,80,30]);
        }
        translate([0,80,0]){
            rotate([0,45+45/2,180]){
                cube([80,80,30]);
            }
        }
        translate([-20,0,-100]){
            cube([40,80,100]);
        }
    }
}

module screw(){
    cylinder(r1=screw_head/2, r2=screw_dia/2, h=screw_head_height);
    cylinder(r=screw_dia/2, h=40);    
    translate([0,0,-0.99]){cylinder(r=screw_head/2, h=1);}    
}



module insideprofile(l){
    difference(){
        union(){
            translate([7.6,10,0]){cube([4.8,10,l]);}
            translate([0,7.6,0]){cube([20,4.8,l]);}  
            
            translate([6.5,10-2.1,0]){cube([7   ,10,l]);}
            translate([2.1,6.5,0]){cube([15.8,7   ,l]);}  
        }
        translate([4,4,-1]){
            cube([12,12,l+2]);
        }
    } 
    translate([20,20,0]){
        rotate([0,-90,0]){
            linear_extrude(20){
                polygon (points=[[0,0],[l,0],[0,l]]);
            }
        }
    }    
}

module extrusion(u,center,front,side){
    len=unit*u;
    difference(){
        translate([0,2,2]){
            minkowski(){
                cube([len,16,16]);
                sphere(d=4);
            }
        } 
        translate([-5,10,1.99]){
            rotate([0,90,0]){linear_extrude(len+10){polygon(points=[[0,-2.5],[2,-4],[2,4],[0,2.5]]);}}
        }
        translate([-5,10,18.01]){
            rotate([0,-90,180]){linear_extrude(len+10){polygon(points=[[0,-2.5],[2,-4],[2,4],[0,2.5]]);}}
        }    
        translate([-5,18.01,10]){
            rotate([90,0,90]){linear_extrude(len+10){polygon(points=[[0,-2.5],[2,-4],[2,4],[0,2.5]]);}}
        }    
        translate([-5,1.99,10]){
            rotate([-90,0,-90]){linear_extrude(len+10){polygon(points=[[0,-2.5],[2,-4],[2,4],[0,2.5]]);}}
        }    
        if(center){
            translate([-5,10,10]){
                rotate([0,90,0]){
                    cylinder(d=4.6,h=len+10);
                }
            }
        }     
        //holes
        if(front){
            for(i=[0:30]){
                translate([unit/2+i*unit,10,-5]){ cylinder(d=3.8,h=30);}
            }
        }    
        if(side){
            for(i=[0:30]){
                translate([unit/2+i*unit,25,10]){ rotate([90,0,0]){cylinder(d=3.8,h=30);}}
            }
        }
        //length cutoff
        translate([-2,0,0]){cube([4,60,60],center=true);}
        translate([len+2,0,0]){cube([4,60,60],center=true);}    
    }
}

module baseplate(u){
    difference(){
        union(){
            translate([1.25,1.25,1.25]){
                minkowski(){
                    cube([sixinch-2.5,unit*u-2.5,gauge-2.5]);
                    sphere(r=1.25);
                }
            }
        }
        //Rack mount holes
        translate([10-0.5,unit/2,-gauge/2])                 {cylinder(r=2.3,gauge*2);}
        translate([sixinch-10+0.5,unit/2,-gauge/2])         {cylinder(r=2.3,gauge*2);}
        translate([10-0.5,u*unit-(unit/2),-gauge/2])        {cylinder(r=2.3,gauge*2);}
        translate([sixinch-10+0.5,u*unit-(unit/2),-gauge/2]){cylinder(r=2.3,gauge*2);}
        if(u>=5){
            translate([10-0.5,(u*unit)/2,-gauge/2])         {cylinder(r=2.3,gauge*2);}
            translate([sixinch-10+0.5,(u*unit)/2,-gauge/2]) {cylinder(r=2.3,gauge*2);}
        }  
    }    
}
