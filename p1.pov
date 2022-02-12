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

#declare Camera_0 = camera {perspective angle 25.5          // front view
                            location  <0.3 , 3,-10>
                            right     x*image_width/image_height
                            look_at   <0.0 ,0 , 0.0>}
#declare Camera_1 = camera {/*ultra_wide_angle*/ angle 120  // de lejos
                            location  <0.0 , 2. ,-5>
                            right     x*image_width/image_height
                            look_at   <0.0 , 1 , 0.0>}
#declare Camera_2 = camera {/*ultra_wide_angle*/ angle 90  //right side view
                            location  <6, 0.5 , 0.8>
                            right     x*image_width/image_height
                            look_at   <0.0 , 1.0 , 0.0>}
#declare Camera_3 = camera {/*ultra_wide_angle*/ angle 30     // top view
                            location <3, 3.5, -5>
                            right     x*image_width/image_height
                            look_at <-1,1,0>
                            translate <5,0,0>
                            rotate <60,120,0>
                            }  
                            
                            
camera {Camera_0}      

// Luz ---------------------------------------------------------------------
light_source{<50,500,250> color White}  

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
    scale <3.5,1,2>
  }

object { 
    mesa
    translate <-2, -1, -4.2> // <x, y, z>
}

#declare copa = 
sor {
  10,
  <0.0, 0.>
  <0.15, 0.01>
  <0.24, 0.02>
  <0.07, 0.1>
  <0.05, 0.11>
  <0.06, 0.4>
  <0.17, 0.6>
  <0.2, 0.772>
  <0.2, 1.4>
  <0.2, 1.5>
  open
  texture {  pigment {rgbf <0.9, 0.9, 0.8, 0.4>}
  } // end of texture 
  interior{ ior 1.5 caustics 0.5}
  scale 0.9 
} // end of sor --------------------------------- 



#declare fichas = 
cylinder { 
    <0,0,0>,<0,0.2,0>, 0.8
    texture{ pigment { color <0.1, 0.1, 1.0> }} // end of texture
      scale 1
    } // end of cylinder  ------------------------------------

object {
    fichas
    scale 1/3
    rotate <-5, 0, 0> // <x°, y°, z°>
    translate<-0.6,0.02,-3.5>
}

#declare caja = 
box { <-1,0,-1>,< 1, 1.6, 1>   
    texture {  pigment {rgbf <0.9, 0.9, 0.9, 0.6>}
  } // end of texture 
} // end of box --------------------------------------

object {
    caja
    scale 1/3.5
    rotate <0, 70, 0> // <x°, y°, z°>
    translate<0,0.001,-3>
}

object {
    fichas
    scale 1/3
    rotate <-80, -60, 20> // <x°, y°, z°>
    translate<0.5,0.2,-3.25>
}

#declare dados =
superellipsoid { 
    <0.2,0.2> 
    texture{ pigment{ color Red} } // end of texture
    scale <1,1,1> 
} // -------------- end superellipsoid

// Dado encima de la caja
object {
    dados
    scale 1/14
    rotate <0, 70, 0> // <x°, y°, z°>
    translate<0,0.5,-3>
}

#declare copaDados = 

union {
    object {
        copa
        scale 1.5
        translate <-0.8, 0, -3> // <x, y, z>
    }

    object {
        dados
        scale 1/14
        rotate <0, 60, 0> // <x°, y°, z°>
        translate <-0.76, 0.7, -3> // <x, y, z>
    }

    object {
        dados
        scale 1/14
        rotate <0, 65, 0> // <x°, y°, z°>
        translate <-0.7, 0.825, -3> // <x, y, z>
    }

    object {
        dados
        scale 1/14
        rotate <0, 65, 0> // <x°, y°, z°>
        translate <-0.68, 0.97, -3> // <x, y, z>
    }

    object {
        dados
        scale 1/12
        rotate <0, 70, 0> // <x°, y°, z°>
        translate <-0.65, 1.14, -3> // <x, y, z>
    }
}

object {
    copaDados
}
