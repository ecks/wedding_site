module SeatingChart exposing (..)

import Collage as C
import Color
import Element as E
import Text as T

displayName offSet name = 
  C.move offSet (C.text (T.fromString name))

displayRect offSet width height = 
  C.move offSet (C.filled (Color.brown) (C.rect width height))

displayImage offSet path width height = 
  C.move offSet (C.toForm (E.image width height path))

displayNames = 
 [displayName (-200, -50) "Aunt Liz",
  displayName (-200, 0) "Mark",
  displayName (-200, 50) "Pat",
  displayName (-200, 100) "Sheilla"] ++

  [displayName (-100, -100) "Harry"] ++

  [displayName (0, -50) "Alice",
  displayName (0, 0) "Jake", 
  displayName (0, 50) "Mike",
  displayName (0, 100) "Pam"] ++

  [displayName (50, -50) "Svetla",
  displayName (50, 0) "Kristina",
  displayName (50, 50) "Fatema",
  displayName (50, 100) "Trisha"] ++

  [displayName (150, -100) "Stilian"] ++

  [displayName (250, -50) "Yana",
  displayName (250, 0) "Nancy",
  displayName (250, 50) "Brenda",
  displayName (250, 100) "Zach"]
        
displayRects = 
 [displayRect (-100, 30) 140 200,
  displayRect (150, 30) 140 200]

displayImages = 
 [displayImage (-160, 100) "images/sheilla_avatar.gif" 40 40,
  displayImage (-160, 50) "images/patrick_avatar.jpg" 40 40,
  displayImage (-160, 0) "images/mark_avatar.png" 40 40,
  displayImage (-160, -50) "images/aunt_liz_avatar.png" 40 40] ++

 [displayImage (-100, -60) "images/harry_avatar.jpeg" 40 40] ++

 [displayImage (-40, 100) "images/pam_avatar.jpg" 40 40,
  displayImage (-40, 50) "images/mike_avatar.jpeg" 40 40,
  displayImage (-40, 0) "images/jake_avatar.jpeg" 40 40,
  displayImage (-40, -50) "images/alice_avatar.jpeg" 40 40] ++

 [displayImage (90, 100) "images/chipmunk_avatar.jpeg" 40 40,
  displayImage (90, 50) "images/bradway_avatar.jpg" 40 40,
  displayImage (90, 0) "images/kristina_avatar.jpg" 40 40,
  displayImage (90, -50) "images/svetla_avatar.jpeg" 40 40] ++

  [displayImage (150, -60) "images/stilian_avatar.jpg" 40 40] ++

  [displayImage (210, 100) "images/zach_avatar.jpg" 40 40,
  displayImage (210, 50) "images/brenda_avatar.jpeg" 40 40,
  displayImage (210, 0) "images/nancy_avatar.png" 40 40,
  displayImage (210, -50) "images/yana_avatar.jpeg" 40 40]


main =
  view

view = 
  (displayRects ++ displayImages ++ displayNames)
    |> C.collage 800 500
    |> E.toHtml    
