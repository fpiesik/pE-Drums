X=70;

baseYZ=25;

jack_dia=12;
jack_depth=50;

 
hitplateA=15;

piezo_dia=28;
piezo_sp=9;
piezoY=15;
piezoY_sp=3;
piezoA=5;

shaftXY=4;

mountY=25;
mountZ=9;
mount_spX=10;

module base(){
difference(){
translate([0,baseYZ/2,baseYZ/2]) cube([X,baseYZ,baseYZ],center=true);
translate([-X/2,baseYZ/2,baseYZ/2]) rotate([0,90,0]) cylinder(d=jack_dia,h=jack_depth);
}
}
module hitplate(){
translate([0,0,0]){
difference(){
hull(){
rotate([-hitplateA,0,0])translate([-X/2,0,0])cube([X,baseYZ,1]);
translate([0,baseYZ/2,(piezo_dia+2*piezo_sp)/2])rotate([90+piezoA,0,0])cylinder(d=piezo_dia+2*piezo_sp,h=piezoY,center=true);}
translate([0,baseYZ/2-piezoY/2-piezoY_sp,(piezo_dia+2*piezo_sp)/2])rotate([90+piezoA,0,0])cylinder(d=piezo_dia,h=2*piezoY,center=true);
//translate([-shaftXY/2,baseYZ/2,-baseYZ/2])cube([shaftXY,shaftXY,hitplateZ+baseYZ/2]);
}
}
}

module mount(){
translate([-X/2,-mountY,0])cube([X,mountY,mountZ]);
translate([X/2,0,mountZ])rotate([0,-90,0])linear_extrude(height=mount_spX, scale=[1,1])polygon(points=[[0,0],[baseYZ-mountZ,0],[0,-mountY]]);
translate([-X/2+mount_spX,0,mountZ])rotate([0,-90,0])linear_extrude(height=mount_spX, scale=[1,1])polygon(points=[[0,0],[baseYZ-mountZ,0],[0,-mountY]]);

}

difference(){
union(){
base();
translate([0,0,baseYZ])rotate([hitplateA,0,0])hitplate();
//hitplate();
mount();
}
translate([piezo_dia/2-shaftXY,baseYZ/2+shaftXY/2-jack_dia/2,(piezo_dia+2*piezo_sp)/4+baseYZ-baseYZ/4]) cube([shaftXY,shaftXY,baseYZ/2+(piezo_dia+2*piezo_sp)/2],center=true);
}