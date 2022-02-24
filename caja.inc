#include "colors.inc"
// camera {
//   location <7,8,-9> * .7
//   look_at 0
// }

// light_source {<20, 15, 20> color White}

#declare baseCaja = 
superellipsoid {<0.25,0.25>
    scale 2
    texture{ pigment{ rgbf <0.9, 0.9, 0.9, 0.7> }
    finish { diffuse 0.1 reflection 0.1
                    specular 0.4}

    } // end of texture -------------------------------------------
} // end of box --------------------------------------

#declare tapaCaja = 
box {
    <-2,0,-2>,  // Near lower left corner
    <2,0.8,2>   // Far upper right corner
    texture { pigment { rgbf <0.9, 0.9, 0.9, 0.7> }}
}

#declare caja = 
object {
    difference {
        object {
            baseCaja
        }
        object {
            tapaCaja
            translate <0, 1.6, 0>
        }
    }
}

