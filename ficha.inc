
#include "colors.inc"
// camera {
//   location <7,8,-9> * .7
//   look_at 0
// }

// light_source {<20, 15, 20> color White}  


#declare ficha_inside =

union { 
  
    cylinder { 
        <0,0,0>,<0,0.1801,0>, 0.6
        texture{ pigment { color White} } // end of texture
        scale 1
    } // end of cylinder  ------------------------------------
    
    cylinder { 
        <0,0,0>,<0,0.18011,0>, 0.55
        texture{ 
           pigment {
                radial color_map{[0.5 Blue][0.5 White]}
                frequency 12
              }
        } // end of texture   
    } // end of cylinder  ------------------------------------
    
    cylinder { 
        <0,0,0>,<0,0.180111,0>, 0.5
        texture{ pigment { color White} } // end of texture
        scale 1
    } // end of cylinder  ------------------------------------

}

#declare ficha =  
union {
    
    object { ficha_inside }
    
    cylinder { 
        <0,0,0>,<0,0.18,0>, 0.8 
        texture{ 
           pigment {
                radial color_map{[0.5 Blue][0.5 White]}
                frequency 6
              }
        } // end of texture   
    } // end of cylinder  ------------------------------------
}                                                            
