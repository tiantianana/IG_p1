#include "colors.inc"
// The standard collection of textures

#include "textures.inc"


// camera {
//   location <7,8,-9> * .7
//   look_at 0
// }

// light_source {<20, 15, 20> color White}

#declare baseCaja = 
superellipsoid {
    <0.25,0.25>
    scale 2
    texture{ 
      pigment{ rgbf <0.9, 0.9, 0.9, 0.5> }
      finish {
      ambient .1
      diffuse .1
      reflection .1
    }
  } // end of texture ------------------------------------------- 
    finish { diffuse 0.1 reflection 0.1
                    specular 0.4}   
    scale <1, 1/1.25, 1>
} // end of box --------------------------------------

#declare tapaCaja =     
superellipsoid {
    <0.25,0.25>
    scale 2
    texture{ 
      pigment{ rgbf <0.9, 0.9, 0.9, 0.5> }
      finish {
      ambient .1
      diffuse .1
      reflection .1
    }
  } // end of texture ------------------------------------------- 
    finish { diffuse 0.1 reflection 0.1
                    specular 0.4}
   scale <1, 1/5, 1>
} // end of box --------------------------------------


#declare caja = 
merge {    
        object {
            tapaCaja 
            no_shadow
            translate <0, 1.5, 0>
        }   
        object {
            baseCaja
            translate <0, -0.2, 0>
        }           
}

                             
