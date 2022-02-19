// A raytraced dice
// 6/1994 Christian Perle <christian.perle@tu-clausthal.de>
// POV version: 2.0 or higher
// Copying policy: LGPL (see file COPYING)

#include "colors.inc"

camera {
  location <-2, 3.5, -1.5>
  direction <0, 0, 2.2>
  look_at <0, 0, 0>
}

light_source { <-9, 7, -6> color White }

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

#declare Dice = difference {
  object {
    DiceBody
    pigment { color Red }
    finish { phong .7 phong_size 20 ambient .4 }
  }
  union {
    object { One rotate -90*z }
    object { Two }
    object { Three rotate -90*x }
    object { Four rotate 90*x }
    object { Five rotate 180*x }
    object { Six rotate 90*z }
    pigment { color White }
    finish { phong .9 phong_size 15 }
  }
  bounded_by { box { <-.52, -.52, -.52>, <.52, .52, .52> } }
}

// object { Dice rotate 90*z }  // 'one' side up
// object { Dice }  // 'two' side up
// object { Dice rotate 90*x }  // 'three' side up
// object { Dice rotate -90*x }  // 'four' side up
// object { Dice rotate 180*x }  // 'five' side up
object { Dice rotate 180*z }  // 'six' side up
