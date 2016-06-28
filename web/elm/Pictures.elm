port module Pictures exposing (..)

import Collage as C
import Color
import Element as E
import Text as T

import Html exposing (text, div, button)
import Html.App exposing (program)
import Html.Events exposing (onClick)

import Array exposing (get, fromList)
import List exposing (length, map, head)

main = 
  program {init = init, view = view, update = update, subscriptions = subscriptions}

type alias Dimensions = { width : Int, height : Int}
type alias Image = { filename : String, dimensions : Dimensions}
type alias Model = { currentImageIndex : Int, images : List Image, cWidth : Int, cHeight : Int }

init = 
  (Model 0 [] 0 0, Cmd.none)

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
      |> C.collage model.cWidth model.cHeight 
      |> E.toHtml
     , button [ onClick Prev ] [text "<"]
     , button [ onClick Next ] [text ">"]]

type Msg = Prev | 
           Next |
           AppendPictures (List PicPortMsg) |
           SetCollage (List ColPortMsg)

pictureToImage picture = 
  Image picture.pictureName (Dimensions picture.width picture.height) 

update msg model = 
  case msg of 
    Prev ->
      (Model ((model.currentImageIndex - 1) % (length model.images)) model.images model.cWidth model.cHeight, Cmd.none)  
    Next ->
      (Model ((model.currentImageIndex + 1) % (length model.images)) model.images model.cWidth model.cHeight, Cmd.none) 
    AppendPictures pictures ->
      let 
        newImages = map pictureToImage pictures
      in
        (Model model.currentImageIndex (newImages ++ model.images) model.cWidth model.cHeight, Cmd.none)
    SetCollage collage ->
      let 
        mCollage =  List.head collage
      in
        case mCollage of
          (Just hCollage) ->
            (Model model.currentImageIndex model.images hCollage.cWidth hCollage.cHeight, Cmd.none)
          Nothing ->
            (Model model.currentImageIndex model.images 0 0, Cmd.none)


type alias PicPortMsg = { pictureName : String, width : Int, height : Int }

port pictures : (List PicPortMsg -> msg) -> Sub msg

type alias ColPortMsg = { cWidth : Int, cHeight : Int }

port collage : (List ColPortMsg -> msg) -> Sub msg

subscriptions model = 
  Sub.batch
    [pictures AppendPictures,
     collage SetCollage]
