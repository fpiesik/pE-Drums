$fn=64;
dia=180;
height=33.5;
wthick= 8;
bthick= 8;
mthick=2;
rodDist=30;
rodDia=6;
kneeZ=10;
socketDia=29;
socketH=rodDia;
triggerDia=35;
triggerBoltDia=6.3;
triggerNutDia=12;
cableDia=4;

difference(){
union(){
difference(){
cylinder(d=dia,h=height-wthick/2);
translate([0,0,bthick])cylinder(d=dia-wthick*2,h=height-wthick/2);
}

translate([0,0,bthick]){
difference() {
rotate_extrude(convexity=10, $fn = 64)
translate([dia/2-wthick*2,0,0])
square(wthick,wthick);
translate([0,0,wthick]){
rotate_extrude(convexity=10, $fn = 64)
translate([dia/2-wthick*2,0,0])
circle(d=wthick*2,$fn=64);
}}}

//difference(){
//translate([0,0,height-kneeZ])cylinder(d1=dia,d2=dia, h=kneeZ-mthick/2);
//translate([0,0,height-kneeZ])cylinder(d1=dia-wthick*2,d2=dia-mthick*2, h=kneeZ-mthick/2);
//}

translate([0,0,height-wthick/2]){
rotate_extrude(convexity = 10, $fn = 64)
translate([dia/2-wthick/2, 0, 0])
circle(d = wthick, $fn = 64);
}

//translate([0,0,rodDia])cube([rodDist+rodDia*2,dia,rodDia*2],center=true);
//translate([0,0,rodDia])cube([dia-wthick*2,rodDist+rodDia*2,rodDia*2],center=true);

}

//translate([rodDist/2,0,rodDia])rotate([90,0,0])cylinder(d=rodDia,h=dia,center=true);
//translate([-rodDist/2,0,rodDia])rotate([90,0,0])cylinder(d=rodDia,h=dia,center=true);
rotate([0,0,22.5])cylinder(d=socketDia,h=bthick/2,$fn=8);

translate([0,dia/2-wthick-triggerDia/2,0])cylinder(d=triggerBoltDia,h=dia);
translate([0,dia/2-wthick-triggerDia/2,bthick/2])cylinder(d=triggerNutDia,h=dia,$fn=6);
translate([0,dia/2-wthick-triggerDia,0])cylinder(d=cableDia,h=dia);

}