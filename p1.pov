#include "colors.inc"
#include "textures.inc"
#include "woods.inc"
#include "skies.inc"

global_settings {
  assumed_gamma 1.0
}          
#default{ finish{ ambient 0.4 diffuse 0.9 }}

//------------------------VALORES UNICOS--------------------------
//Camara, punto de vision 
camera {
  perspective angle 25.5
  location  <0.3, 3, -8>
  right     x*image_width/image_height
  look_at   <0, 0,  0>
} 

sky_sphere {
  pigment {
    gradient y
    color_map {
      [0.0 rgb <0.6,0.7,1.0>]
      [0.7 rgb <0.0,0.1,0.8>]
    }
  }
}       

//---------------------FIN VALORES UNICOS-------------------------
//Fuentes de luz pueden estar entre 1 y n [requerido]
light_source {
  <-30, 30, -30>            // posision
  color White      //color de la luz    
  //shadowless
}

// -----------------SECCI�N DE OBJETOS---------------------------

plane {
  y, -1
  texture{ T_Wood2     
                finish { phong 1 } 
                rotate<0,0,0> scale 0.5 translate<0,0,0>
              } // end of texture 
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
            pigment {Black}
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

#declare huevo = 
ovus{ 1.00, 0.65 // base_radius, top_radius  with: top_radius< base_radius! 
      texture{ pigment{ color rgb< 1.0, 0.9, 0.8>*0.9}  
            // normal { bumps 0.75 scale 0.02 }
               finish { phong 0.3 reflection { 0.00 metallic 0.00}  }
             } // end of texture 
      scale 0.5
      rotate<0,0,0>
      translate<0,0.5,0> 
    } // ------------------------------------------------------------------ 
//-------------------------------------------------------------------------

#declare cereales = 

box { 
  <0,0,0>, < 1.6,2,1> 
  scale 1/2

  pigment { 
      image_map  {
              jpeg "cereales.jpg"
          }
      }

  scale 2
  rotate <10,0,0>

} // end of box --------------------------------------


#declare leche = 
box { 
  <0,0,0>, < 0.85,2.1,0> 
  scale 1/2
  translate <0.3,0,0>

  pigment { 
      image_map  {
              jpeg "leche.jpg"
          }
      }

  translate <-0.3,0,0>
  scale 2

  rotate <10,0,0>

} // end of box --------------------------------------

#declare mantel = 
cylinder { 
  <0,0,0>,<0,0.005,0>, 2.00 

                 texture{ pigment{ radial frequency 35 
                         color_map{ [0.0 color Black]
                                    [0.4 color White]
                                    [0.6 color White]
                                    [1.0 color Black]
                                  }
                       }   
                finish { phong 1 } 
                rotate<0,0,0> scale 0.25 translate<0,0,0>
              } // end of texture -----------------------

 
 
    scale <1,1,1> 
    rotate<0,0,0> 
    translate<0,0,1>
} // end of cylinder  ------------------------------------

object{
    mycup
    scale 1/14
    translate<0.55,1.2,-4.5> 
}

object{
    cuenco
    scale 2/3
    translate<0.1,1,-4.5>
}

object {
  huevo
  scale 1/5
  translate <-0.3,1.2, -4.5>
}

object {
  cereales
  scale 1/3
  translate <0,1.2, -4.2>
}


object {
  leche
  scale 1/3
  translate <-0.4, 1.2, -4.2>
}

object {
    mantel
    scale 1/2
    translate <0.2, 1, -4.2>
}

#declare fondo =
  box { 
      <0,0,0>,< 1, 1, 1>   
      texture{ pigment{ 
          bozo turbulence 0.76
          color_map { 
              [0.0 rgb <0.6,0.7,1.0>]
              [0.7 rgb <0.0,0.1,0.8>]
              [0.6 rgb <1,1,1>]
              [1.0 rgb <0.5,0.5,0.5>]}
              scale 0.25
          }
          finish { phong 1 } 
          rotate<0,0,0> scale 1 translate<0,0,0>
          } // end of texture 
      scale <30,4,20> rotate<0,-15,0> translate<-8.5,-0.4,-0.9> 
  } // end of box --------------------------------------

 object { fondo }
 