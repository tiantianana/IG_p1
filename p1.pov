// Autor: Ana Tian Villanueva
// Fecha: 21/02/2022
// Renderizar con tamaño: -W560 -H529
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

/* Incluir objetos */
#include "caja.inc"
#include "copa.inc"
#include "dado.inc"
#include "ficha.inc"
#include "mesa.inc"

#declare Camera_0 = 
camera {perspective angle 25          // front view
        location  <0,2.3,-10>
        right     x*image_width/image_height
        look_at   <0.0 , 0 , 0.0>}

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

light_source{
    <0,6,-2.5> 
    color White
    spotlight
    radius 90
    falloff 10
    tightness 10
    point_at <0, 2, 0>
}    

light_source{
    <0,6,-2.2> 
    color rgb <0.8, 0.8, 0.8>
}    

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

object { 
    mesa
    translate <-2, -1.38, -4.2> // <x, y, z>
}

/*************************************************************/

/* INICIO OBJETOS COMPUESTOS */
#declare copadado = 
union {
    object {
        copa
        translate <-0.65, 0, -3.2> // <x, y, z>
    }

    object {
        dado
        no_shadow
        scale 1/7
        rotate <0, 50, 0> // <x°, y°, z°>
        translate<-0.6,1,-3.2>
    }

    object {
        dado
        no_shadow
        scale 1/6
        rotate <0, 50, 90> // <x°, y°, z°>
        translate<-0.57,1.15,-3.2>
    }

    object {
        dado
        no_shadow
        scale 1/6
        rotate <0, 230, 0> // <x°, y°, z°>
        translate<-0.55,1.35,-3.2>
    }

    object {
        dado
        no_shadow
        scale 1/5
        rotate <0, 150, -20> // <x°, y°, z°>
         translate<-0.53,1.55,-3.2>
    }

    object {
    ficha
    scale 1/3.25
    rotate <-5, 0, 0> // <x°, y°, z°>
    translate<-0.4,0.08,-3.6>
    }
}

#declare cajadado = 
union {
    object {
    caja
    scale 1/5.5
    rotate <0, 65, 0> // <x°, y°, z°>
    translate<0,-0.12,-3>
    }
    // Dado encima de la caja
    object {
    dado
    scale 1/5
    rotate <5, 25, 180> // <x°, y°, z°>
    translate<0,0.35,-3>
    }
    object {
    ficha
    scale 1/3.2
    rotate <-85, -60, 20> // <x°, y°, z°>
    translate<0.5,-0.15,-3.3>
    }
}

object {
    copadado
    translate <0,-0.45,0>
}

object {
    cajadado
    translate <0.16,0,-0.2>
}
/* FIN OBJETOS COMPUESTOS */
