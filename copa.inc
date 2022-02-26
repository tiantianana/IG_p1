#include "colors.inc"
// camera {
//   location <7,8,-9> * .7
//   look_at 0
// }

// light_source {<20, 15, 20> color White}

#declare copa = 
sor {
  10,
  <0, 0>
  <0.27, 0.04>
  <0.306, 0.068>
  <0.136, 0.102>
  <0.068, 0.187>
  <0.085, 0.68>
  <0.22, 1.02>
  <0.27, 1.36>
  <0.33, 2.38>
  <0.33, 3> // Top
  open
  texture{ 
      pigment{ rgbf <0.9, 0.9, 0.9, 0.5> }
      finish {
      ambient .1
      diffuse .1
      reflection .1
    }
  } // end of texture ------------------------------------------- 
  interior{ ior 1.35 caustics 0.5}
} // end of sor --------------------------------- 
