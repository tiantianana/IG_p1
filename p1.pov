// Autor: Ana Tian Villanueva
// Fecha: 21/02/2022
// Renderizar con tamaño: -H570 -W530 (1x1)
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

#declare Camera_0 = 
camera {perspective angle 25          // front view
        location  <0,2.5,-10>
        right     x*image_width/image_height
        look_at   <0.0 ,0 , 0.0>}

#declare Camera_1 = 
camera {/*ultra_wide_angle*/
        angle 120  // de lejos
        location  <0.0 , 2. ,-5>
        right     x*image_width/image_height
        look_at   <0.0 , 1 , 0.0>}

#declare Camera_2 = 
camera {/*ultra_wide_angle*/ 
        angle 90  //right side view
        location  <6, 0.5 , 0.8>
        right     x*image_width/image_height
        look_at   <0.0 , 1.0 , 0.0>}

#declare Camera_3 = 
camera {/*ultra_wide_angle*/ 
        angle 30     // top view
        location <3, 3.5, -5>
        right     x*image_width/image_height
        look_at <-1,1,0>
        translate <5,0,0>
        rotate <60,120,0>}  
                            
/* INICIO VISTA */                            
camera {Camera_0}      

light_source{<50,600,350> color White}  

sky_sphere { 
    pigment { gradient <0,1,0>
    color_map { [0.00 rgb <0.6,0.7,1.0>]
                [0.35 rgb <0.1,0.0,0.8>]
                [0.65 rgb <0.1,0.0,0.8>]
                [1.00 rgb <0.6,0.7,1.0>] 
            } 
    scale 1        
    } // end of pigment
} //end of skysphere

plane { 
    <0,1,0>, -1
    texture { 
        pigment{ color rgb< 0.75, 0.0, 0.10>}
    } // end of texture 
} // end of plane
/* FIN VISTA */

/* INICIO OBJETOS INDIVIDUALES */
#declare mesa =
box {
    <0,0,0>,  // Near lower left corner
    <1,1,1>   // Far upper right corner
    texture { pigment { color White }}
    scale <4,1,2>
  }

object { 
    mesa
    translate <-2, -1.38, -4.2> // <x, y, z>
}

#declare copa = 
sor {
  10,
  <0, 0>
  <0.15, 0.02>
  <0.18, 0.04>
  <0.08, 0.06>
  <0.04, 0.11>
  <0.05, 0.4>
  <0.13, 0.6>
  <0.15, 0.8>
  <0.17, 1.4>
  <0.17, 1.5> // Top
  open
  texture {  pigment {rgbf <0.9, 0.9, 0.8, 0.4>}
  } // end of texture 
  interior{ ior 1.5 caustics 0.5}
} // end of sor --------------------------------- 

#declare fichas = 
cylinder { 
    <0,0,0>,<0,0.2,0>, 0.8
    texture{ pigment { color rgb <0.0, 0.5, 1.0> }} // end of texture
      scale 1
    } // end of cylinder  ------------------------------------

#declare caja = 
superellipsoid {<0.1,0.1> 
    texture{ pigment{ rgbf <0.9, 0.9, 0.9, 0.5> }
            finish { diffuse 0.1 reflection 0.2  
                    specular 0.8 roughness 0.0003 phong 1 phong_size 400}
    } // end of texture -------------------------------------------
} // end of box --------------------------------------


#declare DiceBody = intersection {
  box { <-.5, -.5, -.5>, <.5, .5, .5> }
  sphere { <0, 0, 0>, .5*1.41421358 }
}

#declare One = sphere { <0, .6, 0>, .14 }

#declare Two = union {
  sphere { <-.25, .6, -.25>, .14 }
  sphere { <.25, .6, .25>, .14 }
}

#declare Three = union {
  object { One }
  object { Two }
}

#declare Four = union {
  sphere { <-.25, .6, -.25>, .14 }
  sphere { <.25, .6, -.25>, .14 }
  sphere { <-.25, .6, .25>, .14 }
  sphere { <.25, .6, .25>, .14 }
}

#declare Five = union {
  object { Four }
  object { One }
}

#declare Six = union {
  object { Four }
  sphere { <-.25, .6, 0>, .14 }
  sphere { <.25, .6, 0>, .14 }
}

#declare dados = difference {
  object {
    DiceBody
    pigment { color Red }
    //finish { phong .7 phong_size 20 ambient .4 }
  }
  union {
    object { One rotate -90*z }
    object { Two }
    object { Three rotate -90*x }
    object { Four rotate 90*x }
    object { Five rotate 180*x }
    object { Six rotate 90*z }
    pigment { color White }
    //finish { phong .9 phong_size 15 }
  }
  bounded_by { box { <-.52, -.52, -.52>, <.52, .52, .52> } }
}
/* FIN OBJETOS INDIVIDUALES */


/* INICIO OBJETOS COMPUESTOS */
#declare copaDados = 
union {
    object {
        copa
        scale 1.7
        translate <-0.7, 0, -3.2> // <x, y, z>
    }

    object {
        dados
        scale 1/14
        rotate <0, 60, 0> // <x°, y°, z°>
        translate <-0.8, 0.7, -3> // <x, y, z>
    }

    object {
        dados
        scale 1/14
        rotate <0, 65, 0> // <x°, y°, z°>
        translate <-0.75, 0.825, -3> // <x, y, z>
    }

    object {
        dados
        scale 1/14
        rotate <0, 65, 0> // <x°, y°, z°>
        translate <-0.725, 0.97, -3> // <x, y, z>
    }

    object {
        dados
        scale 1/12
        rotate <0, 70, 0> // <x°, y°, z°>
        translate <-0.7, 1.13, -3> // <x, y, z>
    }

    object {
    fichas
    scale 1/3.25
    rotate <-5, 0, 0> // <x°, y°, z°>
    translate<-0.45,0.02,-3.5>
    }
}

#declare cajaDados = 
union {
    object {
    caja
    scale <1/3,1/1.7,1/3>
    rotate <0, 70, 0> // <x°, y°, z°>
    translate<0,0.001,-3>
    }
    // Dado encima de la caja
    object {
    dados
    scale 1/4
    rotate <0, 70, 0> // <x°, y°, z°>
    translate<0,0.65,-3>
    }
    object {
    fichas
    scale 1/3.2
    rotate <-85, -60, 20> // <x°, y°, z°>
    translate<0.4,0.25,-3.4>
    }
}
object {
    copaDados
    translate<0,-0.4,0>
}

object {
    cajaDados
}
/* FIN OBJETOS COMPUESTOS */