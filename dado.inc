#include "colors.inc"
// camera {
//   location <7,8,-9> * .7
//   look_at 0
// }

// light_source {<20, 15, 20> color White}


/* INICIO DADOS */
#declare DiceBody = 
intersection {
    box { <-.5, -.5, -.5>, <.5, .5, .5> }
    sphere { <0, 0, 0>, .5*1.4 }
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

#declare dado = 
difference {
    object {
        DiceBody
        pigment { color Red }
    }
    union {
        object { One rotate -90*x }
        object { Two }
        object { Three rotate -90*z }
        object { Four rotate 90*x }
        object { Five rotate 180*x }
        object { Six rotate 90*z }
        pigment { color White }
    }
    bounded_by { box { <-.5, -.5, -.5>, <.5, .5, .5> } }
}
/* FIN DADOS */