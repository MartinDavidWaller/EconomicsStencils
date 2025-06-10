
partNumber = "NFW-04";
versionNumber = "V1.0";

plateWidth = 70;
plateHeight = 80;
plateDepth = 2;

step = 2;
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

module line(x1,xn,yLowerLimit,yUpperLimit,m,c)
{
    for(x = [x1 : step : xn]) {
        
        y = m * x + c;
        
        if ((y > yLowerLimit) && (y < yUpperLimit)) {
        translate([x / 2,y / 2,-1]) cylinder(h = 5,r1 = 1, r2 =1.4, $fn=10);
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
    
    // Add the lines
    
    // Add the lines
    
    for(i = [1 : 1 : 6]) {
        
    line((i - 1) * 16 + 5,(i - 1) * 16 + 16 + 4,00,110,0,100 - (i - 1) * 16);
     
     
    }
    //}
    //line(9,93,5,95,1,-2);
    //line(8,93,5,95,1,25);
    //line(8,93,8,95,-1,100);
    //line(8,93,8,95,-1,60);
        
}
