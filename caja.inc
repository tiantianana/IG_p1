#include "colors.inc"
// camera {
//   location <7,8,-9> * .7
//   look_at 0
// }

// light_source {<20, 15, 20> color White}

#declare baseCaja = 
superellipsoid {
    <0.2,0.2>
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
} // end of box --------------------------------------

#declare tapaCaja = 
box {
    <-1.9,0,-1.9>,  // Near lower left corner
    <1.9,0.8,1.9>   // Far upper right corner
    texture { pigment { rgbf <0.9, 0.9, 0.9, 0.7> }}
}

#declare caja = 
difference {
        object {
            baseCaja
        }
        object {
            tapaCaja
            translate <0, 1, 0>
        }
}

