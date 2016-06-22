module AboutUsPictures exposing (..)

import Collage as C
import Color
import Element as E
import Text as T

import Html exposing (text, div, button)
import Html.App exposing (program)
import Html.Events exposing (onClick)

import Array exposing (get, fromList)
import List exposing (length)

main = 
  program {init = init, view = view, update = update, subscriptions = \_ -> Sub.none}

type alias Dimensions = { width : Int, height : Int}
type alias Image = { filename : String, dimensions : Dimensions}
type alias Model = { currentImageIndex : Int, images : List Image }

init = 
  (Model 0  [Image "images/about_us1.jpg" (Dimensions 250 187), 
            Image "images/about_us2.jpeg" (Dimensions 250 187), 
            Image "images/about_us3.jpg" (Dimensions 140 250), 
            Image "images/about_us4.jpg" (Dimensions 250 187)], Cmd.none)

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
      |> C.collage 250 250
      |> E.toHtml
     , button [ onClick Prev ] [text "<"]
     , button [ onClick Next ] [text ">"]]

type Msg = Prev | Next

update msg model = 
  case msg of 
    Prev ->
      (Model ((model.currentImageIndex - 1) % (length model.images))  model.images, Cmd.none)  
    Next ->
      (Model ((model.currentImageIndex + 1) % (length model.images))  model.images, Cmd.none)  
