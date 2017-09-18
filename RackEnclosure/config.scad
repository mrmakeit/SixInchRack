// This file contains all the parts for a rack enclosure
// It has the format required for a customizable project on Thingiverse
// Note: Calculated variables does not show up in the customizer, hence the *1; 

$fn = 50*1;

part = "f"; // [a:Extrusion no holes,b:Extrusion front holes,c:Extrusion front and side holes,d:End open,e:End grid,f:End chimney,g:End closed,h:Nut-less Trap,i:Panel,j:Panel with handle,k:Handle]


//Hole size for 4mm screws or freedom unit equivalent
Four_mm_screw = 3.8;

//Hole size for 5mm screws or freedom unit equivalent
Five_mm_screw = 4.8;

//Constants, do not change !
sixinch   = 155*1;       // cm = 6"  
width     = 155-20-20;   // 11.5cm between rails
unit      = (44.5/19)*6; // 1U = 14.05cm
gauge     = 3*1;
gauge_box = 2*1;
slip      = 0.35*1;      // extra slip between parts
Units=3;

include <parts.scad>;
