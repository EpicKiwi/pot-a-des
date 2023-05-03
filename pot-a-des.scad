use <threads.scad>

potDiameter=77.5;
potOuterDiameter=81;
deDiameter=30;
capHeight=20;
objectOutsideDiameter=potOuterDiameter+5;
teethHeight=2;
teethWidth=9;
screnHeight=12;
$fn=100;

difference(){
    cylinder(capHeight, d=objectOutsideDiameter);
    translate([0,0,capHeight-0.1])
        cylinder(2, d=potDiameter);
    translate([0,0,10])
        cylinder(capHeight - 10, d1=deDiameter, d2=potDiameter, $fn=10);
    translate([0,0,5])
        cylinder(6, d=deDiameter, $fn=10);
}

translate([0,0,capHeight])
    difference(){
        cylinder(screnHeight, d=objectOutsideDiameter);
        translate([0,0,-0.5])
            difference(){
                cylinder(screnHeight+1, d=potOuterDiameter);
                translate([0,0,screnHeight-2])
                    intersection(){
                    rotate_extrude()
                        translate([potDiameter/2,0,0])
                            polygon([
                                [(potOuterDiameter - potDiameter)/2,0],
                                [0, teethHeight/2],
                                [(potOuterDiameter - potDiameter)/2, teethHeight],
                            ]);
                     for(i = [0:3]){
                        rotate([0, 0, i * (360/3)])
                        cube([teethWidth, potOuterDiameter+10, teethHeight+10], center=true);
                    }
                    }
            }
    }