
partNumber = "NFW-01";
versionNumber = "V1.2";

plateWidth = 70;
plateHeight = 80;
plateDepth = 2;

step = 1;
//step = 0.2;

module makeText(text,r,s)
{
    // Extude it by 5mm, rotate it and centre it. 
    
    linear_extrude(5) 
        rotate([0,0,r])
        text(text, 
                font="arial:style=Bold", 
                size = s, 
                valign="center", 
                halign="center");       
}

module curve(x) {
    
    for(i = [5 : step : 90]) {
        
        y = x / i;
        
        if (y < 90) {
        translate([i / 2,y / 2,-1]) cylinder(h = 5,r1 = 1, r2 =1.4, $fn=10);
        }
    }
}

difference()
{
    // Build the plate
    
    translate([-10,-10,0]) 
        cube([plateWidth,plateHeight,plateDepth]);

    // Add the title
    
    translate([15,60,1]) makeText(partNumber,0,8);   
    translate([47,60,1]) makeText(versionNumber,0,6); 
    
    // Add the Axes
    
    for(i = [0 : step : 50]) {    
        
        translate([0,i,-1]) 
            cylinder(h = 5,r1 = 1, r2 =1.4, $fn=10);
        
        translate([i,0,-1]) 
            cylinder(h = 5,r1 = 1, r2 =1.4, $fn=10);
    }        
    
    // Add the curves
    
    curve(700);
    curve(1300);
    curve(2100);
   
}
