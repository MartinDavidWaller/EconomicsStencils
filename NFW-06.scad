
partNumber = "NFW-06";
versionNumber = "V1.1";
lastFour = "Last Four";
rotateAntiClockwise = "Rotate Anti-Clockwise";

plateWidth = 120;
plateHeight = 120;
plateDepth = 2;

step = 2;
step = 0.2;

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

difference()
{
    // Build the plate
    
    translate([0,0,0]) 
        cube([plateWidth,plateHeight,plateDepth]);

    // Add the title
    
    translate([30,110,1]) makeText(partNumber,0,8);   
    translate([62,110,1]) makeText(versionNumber,0,6); 
    translate([10,55,1]) makeText(lastFour,90,8); 
    translate([110,60,1]) makeText(rotateAntiClockwise,270,6);
    
    // Add the lines
    
    for(i = [1 : 1 : 5]) {
        
        //if ((i != 1) && (i != 5)) {
            
            for(j = [0 : step : 90]) {    
        
        translate([0 + i * 20,j + 10,-1]) 
            cylinder(h = 5,r1 = 1, r2 =1.4, $fn=10);
        

    //}
        }
    }
    
    startR1 = 1.5;
    endR2 = 2.4;
    
    translate([5,5,-1]) 
            cylinder(h = 5,r1 = startR1, r2 =endR2, $fn=10);
    translate([plateWidth - 5,5,-1]) 
            cylinder(h = 5,r1 = startR1, r2 =endR2, $fn=10); 
    translate([plateWidth - 5,plateHeight - 5,-1]) 
            cylinder(h = 5,r1 = startR1, r2 =endR2, $fn=10); 

        
}
