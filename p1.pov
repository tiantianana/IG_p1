#version 3.7;
global_settings{ assumed_gamma 1.0 }
#default{ finish{ ambient 0.4 diffuse 0.4 }} 

#include "colors.inc"

camera {
  location  <5, 10, -30>
  look_at   < .7, 2.3,  0>
  angle 15
} 

light_source {
  <20, 13, -60>,
  White
}

sky_sphere {
  pigment {
    gradient y
    color_map {
      [0 color White]
      [1 color Blue]
    }
  }
  scale 2
  translate <0,1,0>
}  


#declare mycup = 

difference {

    union {
        //cup
        cylinder {
            <0,0,0>, <0, 4.75, 0>, 2
            
            scale 1/7
            translate <0,0.1,0>
            
            pigment { 
                image_map  {
                    jpeg "fdp.jpg"
                    map_type 2
                }
            }

            translate <0,-0.1,0>
            scale 7
            finish { ambient .4}

            rotate <0, -100, 0> // <x°, y°, z°>
        }


        // handle
        sphere_sweep {
            b_spline 7,
            < .7, 2.2, 0> .8
            <1.5, .5, 0>, .3
            <3.1, .5, 0>, .3
            <4, 2.4, 0> .3
            <3.1, 4.1, 0>, .3
            <1.5, 4.1, 0>, .3
            <.7, 2.6 , 0>, .6
            pigment {Red}
            finish { ambient .4}
        }
    }

    // inside cup
    cylinder {
        <0, .2, 0>, <0, 4.9, 0> 1.8
        pigment {White}
        finish {ambient .4}
    }

}

#declare cuenco = 
    lathe{  // rotates a 2-D outline of points around the Y axis to create a 3-D shape
    quadratic_spline // quadratic_spline | cubic_spline | linear_spline 
    9,      // number of points,
    //<1.1, 1>,
    <1.4, 1>, // list of <x,y> points,
    <1.2, 2.35>, 
    <1.1, 3>,
    <0.0, 3.00000000000000001>,
    <1.0, 3.01>, 
    <2.0, 3.5>,
    <2.8, 4.555>,
    <2.7, 4.65>,
    <2.8, 4.65>
    // sturm        

    pigment {White}

    scale<0.98,1.045,0.98>*0.125 
    rotate<0,0,0> 
    translate<0,0.0,0>
    } // 




object{
    mycup
    scale 1/4
    translate <2, 2, 0>
}

object{
    cuenco
    scale 5/2
    translate <-1, 1, 0>    
}
       