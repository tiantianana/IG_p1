
#include "colors.inc"
// camera {
//   location <7,8,-9> * .7
//   look_at 0
// }

// light_source {<20, 15, 20> color White}

#declare ficha = 
union {
    cylinder { 
    <0,0,0>,<0,0.201,0>, 0.6
    texture{ pigment { color White} } // end of texture
      scale 1
    } // end of cylinder  ------------------------------------
    cylinder { 
        <0,0,0>,<0,0.2,0>, 0.8
        scale 4
        translate <0,0.1,0>
        texture{ pigment{ checker // 2 colors/textures
            color White
            color Blue }    } // end of texture
        translate <0,-0.1,0>
        scale 1/4
    } // end of cylinder  ------------------------------------
}