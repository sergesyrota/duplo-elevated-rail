use <libpeter.scad>;

f=1.5; // number fatness
nh=8; // number height

findiam=10.2; // fitting inner diameter
condiam=9.2; // connector outer diameter



module start(x,y,or){
  translate(v=[x,y,0]){
   	rotate(a=or,v=[0,0,1]){
	     difference(){
	        union(){
	      		difference(){
			         //main
			         cube(size=[15.85,63.65, 6.5]);
			
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
				          cylinder(h=6,r=findiam/2+1.25,center=true);
			          }
			         }
			        union(){
			          for (i=[0:3]){
				          translate(v=[8.45-1.25/2,15.85/2+i*16,-1])
				          cylinder(h=11,r=findiam/2,center=true);
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
			          translate(v=[-8.45+1.25/2,15.85/2+16,8.1])
					   cylinder(h=2,r=condiam/2,center=true);
			          translate(v=[-8.45+1.25/2,15.85/2+16,5.1])
					   cylinder(h=3,r1=2.5, r2=condiam/2,center=true);      
			          translate(v=[-8.45+1.25/2,15.85/2+16,0])
					   cylinder(h=6,r=2.5,center=true);
			          translate(v=[-8.45+1.25/2,15.85/2+16-3,6.1])
				       cube(size=[8.45,6,4],center=true);
	                  supportbeam(0,15.85/2+16-3,3.1,90,6,3);
		           }
	          }
	       
	           // rail section connector hole
	         	union(){
		          translate(v=[8.45-1.25/2,15.85/2+2*16,-1])
				   cylinder(h=22,r=findiam/2,center=true);
	              translate(v=[-0.1,15.85/2+2*16-4,-1])
				   cube(size=[8.45,8,22],center=true);	      
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
			          cylinder(h=6,r=findiam/2+1.25,center=true);
			          translate(v=[8.45-1.25/2+15.85,15.85/2+i*16,0])
			          cylinder(h=6,r=findiam/2+1.25,center=true);		          }
		         }
		        union(){
		          for (i=[0:3]){
			          translate(v=[8.45-1.25/2,15.85/2+i*16,-1])
			          cylinder(h=11,r=findiam/2,center=true);
			          translate(v=[8.45-1.25/2+15.85,15.85/2+i*16,-1])
			          cylinder(h=11,r=findiam/2,center=true);
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

module singlerail(x,y,z,a){
   translate(v=[x,y,z]){
      rotate(a=a,v=[0,0,1]){
         union(){
            //vertical wall (bottom)
            translate(v=[0,15.5,0])
            cube(size=[2*32.40+4*15.85,1.5,7.35]);
            // horizontal beam
            translate(v=[0,15.5-12.6+1.5,5.35])
            cube(size=[2*32.40+4*15.85,12.6,2]);
            // triangular cross section wall
            translate(v=[0,2.5+16.0,7+8.85])
            scale(v=[1,2.5,9])
            rotate(a=180,v=[1,0,0])
            supportbeam(0,0,0,0,2*32.40+4*15.85,1);
            // support beams
            supportbeam(0,17,5.45,0,2*32.40+4*15.85,1.5);
            supportbeam(0+2*32.40+4*15.85,16,4.35,180,2*32.40+4*15.85,1);

		      // internal support structure
		      difference(){
		        union(){
		          // rings
		          for (i=[1,2,5,6]){
	
			          translate(v=[8+i*16.0,15.85/2,0])
			          cylinder(h=6,r=findiam/2+1.25,center=true);		          
		         }
               }
		        union(){
		          for (i=[1,2,5,6]){
			          translate(v=[8+i*16.0,15.85/2,-1])
			          cylinder(h=20,r=findiam/2,center=true);
		          }
                }
                translate(v=[-1,-1,-1])
                cube(size=[150,15.5-12.6+2.5,16]);
              }

           // grip profile
           for (i=[0:127]){
              translate(v=[i,6,7.35])
              cube(size=[0.5,12,0.5]);
           }
            
         }
      }
   }
}


module railsection(x,y,a){
   translate(v=[x,y,0]){
      rotate(a=a,v=[0,0,1]){
         difference(){
	         union(){
	            start(0,0,0);
	
	            difference(){
		            center(15.85+32.40,0,0);
		            number(1,15.85+32.40+2,32,9.2,6,nh,f);
		            number(9,15.85+32.40+8.5,32,9.21,6,nh,f);
		            number(0,15.85+32.40+15,32,9.2,6,nh,f);
		            number(6,15.85+32.40+21.5,32,9.2,6,nh,f);
		            number(1,15.85+32.40+5+8,23,9.2,6,nh,f);
                }
	
	            start(2*15.85+32.40+2*15.85+32.40,63.65,180);
	
	            singlerail(0,0,0,0);
	
	            singlerail(4*15.85+2*32.40,63.65,0,180);
	
	         }
            // translate(v=[-20,30,-1])
           //  cube(size=[200,200,200]);
         }
      }
   }
}

railsection(0,0,-65);