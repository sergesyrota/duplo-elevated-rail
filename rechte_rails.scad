use <libpeter.scad>;

f=1.5; // number fatness
nh=8; // number height

findiam=10.2; // fitting inner diameter
condiam=9.2; // connector outer diameter

// How much to lift the section
lift=18;


module start(x,y,or,zlift=0){
  translate(v=[x,y,0]){
   	rotate(a=or,v=[0,0,1]){
	     difference(){
	        union(){
	      		difference(){
			         //main
			         cube(size=[15.85,63.65, 6.5+zlift]);
			
			         // internal/bottom cavity
			         translate(v=[1.5,1.5,-1.5])
			         cube(size=[12.85,60.65, 6.5]);
			 
			      }
			
			      // ridge supporting roof
			      rectsupportingridge(1.5,1.5,5-1,0,12.85,60.65,1);
			
			      // internal support structure
			      difference(){
			        union(){
                     // increasing the bottom surface area:
			          cube(size=[15.85,63.65, 6.5]);

			          // vertical walls
			          translate(v=[8.45-1.25,0,0])
			          cube(size=[1.25,63.65,6.5]);
			          for (i=[0:3]){
			         	  translate(v=[0,8.45-1.25+16*i,0])
				          cube(size=[15.85,1.25,6.5]);          
			          } 
			          // rings
			          for (i=[0:3]){
				          translate(v=[8.45-1.25/2,15.85/2+i*16,0])
				          cylinder(h=6,r=findiam/2+1.25,center=false);
			          }
			         }
			        union(){
			          for (i=[0:3]){
				          translate(v=[8.45-1.25/2,15.85/2+i*16,-1])
				          cylinder(h=11,r=findiam/2,center=false);
			          }
			        }
			
			      }
			
			      // central plateau
			      translate(v=[0,(63.65-28)/2,6.5])
			      cube(size=[15.85,28,3.6],center=false);
	
	              // straigth vertical walls of rail section connector hole
	              translate(v=[0,15.85/2+2*16-5.5,])
	        	   cube(size=[8.45,11,10.1],center=false);	
	
		           // rail section connector
		         	union(){
			          translate(v=[-8.45+1.25/2,15.85/2+16,8.1+zlift])
					   cylinder(h=2,r=condiam/2,center=false);
			          translate(v=[-8.45+1.25/2,15.85/2+16,5.1+zlift])
					   cylinder(h=3,r1=2.5, r2=condiam/2,center=false);      
			          translate(v=[-8.45+1.25/2,15.85/2+16,0])
					   cylinder(h=6+zlift,r=2.5,center=false);
			          translate(v=[-8.45+1.25/2,15.85/2+16-3,6.1+zlift])
				       cube(size=[8.45,6,4],center=false);
	                  supportbeam(0,15.85/2+16-3,3.1+zlift,90,6,3);
		           }
	          }
	       
	           // rail section connector hole
	         	union(){
		          translate(v=[8.45-1.25/2,15.85/2+2*16,-1+zlift])
				   cylinder(h=22,r=findiam/2,center=false);
	              translate(v=[-0.1,15.85/2+2*16-4,-1+zlift])
				   cube(size=[8.45,8,22],center=false);	      
	           }
	       }
	   }
   }
}

module center(x,y,or){ 
   translate(v=[x,y,0]){

     rotate(a=or,v=[0,0,1]){
        union(){
      		difference(){
		         //main
		         cube(size=[2*15.85,63.65, 6.5]);
		
		         // internal/bottom cavity
		         translate(v=[1.5,1.5,-1.5])
		         cube(size=[2*15.85-3,60.65, 6.5]);
		 
		      }
		
		      // ridge supporting roof
		      rectsupportingridge(1.5,1.5,5-1,0,2*15.85-3,60.65,1);
		
		      // internal support structure
		      difference(){
		        union(){
		          // vertical walls
		          translate(v=[8.45-1.25,0,0])
		          cube(size=[1.25,63.65,6.5]);
		          translate(v=[8.45-1.25+15.85,0,0])
		          cube(size=[1.25,63.65,6.5]);
		          for (i=[0:3]){
		         	  translate(v=[0,8.45-1.25+16*i,0])
			          cube(size=[2*15.85,1.25,6.5]);          
		          } 
		          // rings
		          for (i=[0:3]){
			          translate(v=[8.45-1.25/2,15.85/2+i*16,0])
			          cylinder(h=6,r=findiam/2+1.25,center=false);
			          translate(v=[8.45-1.25/2+15.85,15.85/2+i*16,0])
			          cylinder(h=6,r=findiam/2+1.25,center=false);		          }
		         }
		        union(){
		          for (i=[0:3]){
			          translate(v=[8.45-1.25/2,15.85/2+i*16,-1])
			          cylinder(h=11,r=findiam/2,center=false);
			          translate(v=[8.45-1.25/2+15.85,15.85/2+i*16,-1])
			          cylinder(h=11,r=findiam/2,center=false);
		          }
		        }
		
		      }
		
		      // central plateau
		      translate(v=[0,(63.65-28)/2,6.5])
		      cube(size=[2*15.85,28,3.6],center=false);

          }
       
       }
   }
}

module singlerail(x,y,z,a, zlift=0){
   translate(v=[x,y,z]){
      rotate(a=a,v=[0,0,1]){
         union(){
            //vertical wall (bottom)
            translate(v=[0,15.5,0])
            cube(size=[2*32.40+4*15.85,1.5,7.35]);
            // Original horizontal beam
            if (zlift==0) {
                translate(v=[0,15.5-12.6+1.5,5.35]) cube(size=[2*32.40+4*15.85,12.6,2]);
                // triangular cross section wall
                translate(v=[0,2.5+16.0,7+8.85])
                scale(v=[1,2.5,9])
                rotate(a=180,v=[1,0,0])
                supportbeam(0,0,0,0,2*32.40+4*15.85,1);
                // original grip profile
                for (i=[0:127]){
                    translate(v=[i,6,7.35])
                    cube(size=[0.5,12,0.5]);
                }
            } else {
                // Elevated horizontal beam
                if (a>0) {
                    translate(v=[0,17,5.35]) lift_track(2*32.40+4*15.85,12.6,2,zlift);
                } else {
                    translate([(2*32.40+4*15.85),0,0]) mirror([1,0,0]) translate(v=[0,17,5.35]) lift_track(2*32.40+4*15.85,12.6,2,zlift);
                }
            }
            // support beams
            supportbeam(0,17,5.45,0,2*32.40+4*15.85,1.5);
            supportbeam(0+2*32.40+4*15.85,16,4.35,180,2*32.40+4*15.85,1);

		      // internal support structure
		      difference(){
		        union(){
		          // rings
		          for (i=[1,2,5,6]){
	
			          translate(v=[8+i*16.0,15.85/2,0])
			          cylinder(h=6,r=findiam/2+1.25,center=false);		          
		         }
               }
		        union(){
		          for (i=[1,2,5,6]){
			          translate(v=[8+i*16.0,15.85/2,-1])
			          cylinder(h=20,r=findiam/2,center=false);
		          }
                }
                translate(v=[-1,-1,-1])
                cube(size=[150,15.5-12.6+2.5,16]);
              } 
         }
      }
   }
}


module railsection(x,y,a,zlift=0){
   translate(v=[x,y,0]){
      rotate(a=a,v=[0,0,1]){
         difference(){
	         union(){
	            start(0,0,0,zlift=zlift);
	
	            difference(){
		            center(15.85+32.40,0,0);
		            number(1,15.85+32.40+2,32,9.2,6,nh,f);
		            number(9,15.85+32.40+8.5,32,9.21,6,nh,f);
		            number(0,15.85+32.40+15,32,9.2,6,nh,f);
		            number(6,15.85+32.40+21.5,32,9.2,6,nh,f);
		            number(1,15.85+32.40+5+8,23,9.2,6,nh,f);
                }
	
	            start(2*15.85+32.40+2*15.85+32.40,63.65,180);
	
	            singlerail(0,0,0,0, zlift=zlift);
	
	            singlerail(4*15.85+2*32.40,63.65,0,180, zlift=zlift);
	
	         }
            // translate(v=[-20,30,-1])
           //  cube(size=[200,200,200]);
         }
      }
   }
}

railsection(0,0,0,zlift=18);

module lift_track(length, width, thick, zlift) {
    epsilon=0.01;
    radius = ((pow(length,2)/4)+pow(((zlift)/2),2))/(2*((zlift)/2));
    angle=asin(((length+0.7)/2)/radius);
    $fn=radius*20;
    //translate([0,-width,0]) cube([length, width, thick]);
    support_thick=1.6;
    support_height=6;
    union() {
        translate([0,0,radius]) rotate([90,0,0]) intersection() {
            translate([0,thick,0]) toothed_wheel(radius, thick, width, inside=true, support_thick=support_thick, support_height=support_height);
            //translate([0,-radius,0]) cube([length, zlift/2+thick/2, width]);
            rotate([0,0,-90]) translate([0,0,-support_thick]) pie(radius,width+support_thick,angle);
        }
        translate([length,0,-radius+zlift+thick]) rotate([90,0,0]) intersection() {
            translate([0,0,0]) toothed_wheel(radius, thick, width, outside=true, support_thick=support_thick, support_height=support_height);
            //translate([-length,radius-(zlift/2)-thick/2,0]) cube([length, zlift/2+thick/2+0.5, width]);
            rotate([0,0,90]) translate([0,0,-support_thick]) pie(radius+support_height,width+support_thick,angle);
        }
        // support profile for the rail
        support_step=thick/2;
        for (i=[0:length/support_step/2]) {
            support_height=thick/2 + radius - sqrt(pow(radius,2) - pow(i*support_step,2));
            translate([support_step*i,-width,0]) cube([support_step, width+support_thick, support_height]);
        }
        for (i=[1:(length/support_step/2)]) {
            support_height=thick+zlift - (thick/2 + radius - sqrt(pow(radius,2) - pow(i*support_step,2)));
            translate([length-support_step*i,-width,0]) cube([support_step, width+support_thick, support_height]);
        }
    }
}

// Grip: 0.5x0.5, every 1mm

module toothed_wheel(radius, thick, width, inside=false, outside=false, support_thick=0, support_height=0) {
    //length=100; width=10; thick=2; zlift=18;

    epsilon=0.01;
    //radius = ((pow(length,2)/4)+pow(((zlift)/2),2))/(2*((zlift)/2));
    $fn=radius*20;
    union() {
        translate([0,-thick/2,0]) difference() {
            cylinder(r=radius+thick/2, h=width);
            translate([0,0,-epsilon]) cylinder(r=radius-thick/2, h=width+2*epsilon);
        }
        if (inside) {
            // grip profile, inside
            num_profiles = 2*3.14*(radius-thick/2); // circumference of the circle
            for (i=[0:num_profiles]) {
                translate([0,-thick/2,0]) rotate([0,0,45+i*360/num_profiles]) translate([-0.25, -radius+thick/2, 0]) cube([0.5,0.5,width]);
            }
        }
        if (outside) {
            // grip profile, outside
            num_profiles = 2*3.14*(radius+thick/2); // circumference of the circle
            for (i=[0:num_profiles]) {
                translate([0,-thick/2,0]) rotate([0,0,45+i*360/num_profiles]) translate([-0.25, -radius-thick/2-0.5, 0]) cube([0.5,0.5,width]);
            }
        }
        // support rail
        if (inside) {
            translate([0,-thick/2,-support_thick]) difference() {
                cylinder(r=radius+thick/2, h=support_thick);
                translate([0,0,-epsilon]) cylinder(r=radius-thick/2-support_height, h=support_thick+epsilon*2);
            }   
        }
        if (outside) {
            translate([0,-thick/2,-support_thick]) difference() {
                cylinder(r=radius+thick/2+support_height, h=support_thick);
                translate([0,0,-epsilon]) cylinder(r=radius-thick/2, h=support_thick+epsilon*2);
            }   
        }
    }
}

module pie(r, h, degrees) {
    $fn=r*20;
    intersection() {
        cylinder(r=r, h=h);
        translate([-r,0,0]) cube([r*2,r,h]);
        rotate([0,0,degrees-180]) translate([-r, 0, 0]) cube([r*2,r,h]);
    }
}