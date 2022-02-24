#include "colors.inc"
// camera {
//   location <7,8,-9> * .7
//   look_at 0
// }

// light_source {<20, 15, 20> color White}

#declare mesa =
box {
    <0,0,0>,  // Near lower left corner
    <1,1,1>   // Far upper right corner
    texture { pigment { color White }}
    scale <4,1,2>
  }
