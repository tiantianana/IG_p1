// Autores: Ana Tian Villanueva
// Fecha: 21/02/2022
// Renderizar con tamaño: -H640 -W535
//--------------------------------------------------------------------------
#version 3.7;
global_settings{ assumed_gamma 1.0 }
#default{ finish{ ambient 0.1 diffuse 0.9 }} 

#include "colors.inc"
#include "textures.inc"
#include "glass.inc"
#include "metals.inc"
#include "golds.inc"
#include "stones.inc"
#include "woods.inc"
#include "shapes.inc"
#include "shapes2.inc"
#include "functions.inc"
#include "math.inc"
#include "transforms.inc"

#declare Camera_0 = camera {perspective angle 25.5             // front view
                            location  <0.3 , 3,-10>
                            right     x*image_width/image_height
                            look_at   <0.0 ,0 , 0.0>}
#declare Camera_1 = camera {/*ultra_wide_angle*/ angle 120   // diagonal view
                            location  <0.0 , 1.0 ,-0.7>
                            right     x*image_width/image_height
                            look_at   <0.0 , 0.5 , 0.0>}
#declare Camera_2 = camera {/*ultra_wide_angle*/ angle 90  //right side view
                            location  <6, 0.5 , 0.8>
                            right     x*image_width/image_height
                            look_at   <0.0 , 1.0 , 0.0>}
#declare Camera_3 = camera {/*ultra_wide_angle*/ angle 90        // top view
                            location  <0.0 , 2. ,-4>
                            right     x*image_width/image_height
                            look_at   <0.0 , 1.0 , 0.0>}  
                            
                            
camera {Camera_0}      

// Luz ---------------------------------------------------------------------
light_source{< -10,1000,680> color White}  

sky_sphere { pigment { gradient <0,1,0>
    color_map { [0.00 rgb <0.6,0.7,1.0>]
                [0.35 rgb <0.1,0.0,0.8>]
                [0.65 rgb <0.1,0.0,0.8>]
                [1.00 rgb <0.6,0.7,1.0>] 
            } 
    scale 2         
    } // end of pigment
} //end of skysphere

plane { 
    <0,1,0>, -1
    texture { 
        pigment{ color rgb< 0.75, 0.0, 0.10>}
    } // end of texture 
} // end of plane

#declare mesa =
box {
    <0,0,0>,  // Near lower left corner
    <1,1,1>   // Far upper right corner
    texture { pigment { color White }}
    rotate <0,0,0> // <x°, y°, z°>
    scale <5,1,2>
  }

object { 
    mesa
    translate <-2.5, -1, -4> // <x, y, z>
}

#declare copa = 
sor {
  12,
  <0.00,0.00> 
  <0.2,0.00> 
  <0.0689, 0.031>
  <0.0312, 0.050>
  <0.0583, 0.347>
  <0.1326, 0.381>
  <0.1962, 0.464>
  <0.2387, 0.602>
  <0.2493, 0.721>
  <0.2394, 0.864>
  <0.1991, 1.000>
  <0.1048, 1.055>
  open

   // sturm  // optional!
    material{   //-----------------------------------------------------------
        texture { pigment{ rgbf <0.98, 0.92, 0.80, 0.7>*0.8 }
                  finish { diffuse 0.1 reflection 0.25  
                           specular 0.8 roughness 0.0003 phong 1 phong_size 400}
                } // end of texture -------------------------------------------
        interior{ ior 1.5 caustics 0.5
                } // end of interior ------------------------------------------
      } // end of material ----------------------------------------------------
 
     scale 0.95  rotate<0,0,0> translate<0,0.0,0>
} // end of sor --------------------------------- 

object {
    copa
    scale 1.5
    translate <-1, 0, -3> // <x, y, z>
}

