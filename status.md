
* doing each glyph on its own svg sheet (via inkscape). seems to be working
  well- very easy to experiment, put next to other glyphs, merge paths, etc.
* finished most of the easy lowercase glyphs - next is 's' which should be
  interesting.
* don't have any code for it yet- but I suspect I'll write something to
  transform the individual svg files into a single svg font file - can use
  essentially the same paths (might need a transformation). Then I can pull
  that into fontforge, polish up the metadata and export in various formats.
  Then, finally, I can test for real. (uh, maybe I should do this now so I can
  iterate a little better).



### Older

* inkscape's font stuff is buggy
  - random things not persisted
  - especially width not persisted
  - unknown how it figures out where the baseline is...
  - randomly changes the left and right bearings a bit
  - difficult to work with- takes lots of clicks
  - can't get the "round to nearest pixel" plugin to work - so lots of times
    adjusting x/y/w/h manually
  - (scanning its source code didn't help much- pretty obtuse)

* on the other hand, much easier to work w/ the curves than fontforge.

* fontforge:
  - faculties for messing around with basic "pieces" severely limited
  - tends to make some weird path points when merging two pieces
  - even more difficult to tune exact coordinates than inkscape...
  - (unfamiliar to me, of course)

* actual attempts thus far:
  - seem too squat
  - render smaller than inconsolata etc.
  - _kind of_ meet the goal of being "core", but also kind of distract from it
    with their roundness...
  - were built with lots of logistical trouble (honestly, designing the glyphs
    [in inkscape] was the easiest part)
  - don't seem to have the right proportions...

* ideas
  - glyphs as objects in inkscape - script that transforms them into svg-font,
    then go through fontforge...
      * would need to still fix the dumb pixel snapping... DoNE
