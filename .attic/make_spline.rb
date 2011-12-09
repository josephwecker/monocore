#!/usr/bin/env ruby
# FREE MONO
# ascent       800
# descent      200
# width        600
# x-height (regular)       417
# cap height (regular)     563
# italic angle (oblique)   -12°
# stroke width (regular)   40 or 41
# height of minus sign (centre)	279-282

#$ascent       = 820
#$descent      = 180
#$width        = 500

#$cap_height   = $ascent - $descent
#$base_stroke  = $cap_height / 10
#$x_height     = 7 * $base_stroke

$base_stroke   = 64
$ascent        = 13 * $base_stroke
$descent       = 3 * $base_stroke
$width         = 8 * $base_stroke
$cap_height    = $ascent - $descent + $base_stroke
$x_height      = 8 * $base_stroke


puts "
  ascent:      #{$ascent}  | #{$ascent / 64.0}
  descent:     #{$descent}  | #{$descent / 64.0}
  width:       #{$width}  | #{$width / 64.0}
  cap-height:  #{$cap_height}  | #{$cap_height / 64.0}
  base-stroke: #{$base_stroke}  | #{$base_stroke / 64.0}
  x-height:    #{$x_height}  | #{$x_height / 64.0}"


#glyph_a = [[:

