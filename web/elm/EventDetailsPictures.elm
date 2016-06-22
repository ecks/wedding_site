port module EventDetailsPictures exposing (..)

import Collage as C
import Color
import Element as E
import Text as T

import Html exposing (text, div, button)
import Html.App exposing (beginnerProgram)
import Html.Events exposing (onClick)

import Array exposing (get, fromList)
import List exposing (length)

main = 
  beginnerProgram {model = model, view = view, update = update}

type alias Dimensions = { width : Int, height : Int}
type alias Image = { filename : String, dimensions : Dimensions}
type alias Model = { currentImageIndex : Int, images : List Image }

model = 
  Model 0  [Image "images/event_details1.jpg" (Dimensions 250 145), 
            Image "images/event_details2.jpg" (Dimensions 250 145)]

getImageFromModel {currentImageIndex, images} =
  case get currentImageIndex (fromList images) of
    Just a ->
      a
    Nothing ->
      (Image "" (Dimensions 0 0))

displayImage offSet path width height = 
  C.move offSet (C.toForm (E.image width height path))

displayImages model = 
  let 
    image = getImageFromModel model
  in
    [displayImage (0, 0) image.filename image.dimensions.width image.dimensions.height]

view model =
  div []
    [displayImages model {-- ++ [displayTriangle (5, -100) 5, (C.rotate (degrees 180) (displayTriangle (-5, -100) 5))] --}
      |> C.collage 250 145
      |> E.toHtml
     , button [ onClick Prev ] [text "<"]
     , button [ onClick Next ] [text ">"]]

type Msg = Prev | Next

update msg model = 
  case msg of 
    Prev ->
      Model ((model.currentImageIndex - 1) % (length model.images))  model.images  
    Next ->
      Model ((model.currentImageIndex + 1) % (length model.images))  model.images  
