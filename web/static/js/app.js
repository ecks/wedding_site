// Brunch automatically concatenates all files in your
// watched paths. Those paths can be configured at
// config.paths.watched in "brunch-config.js".
//
// However, those files will only be executed if
// explicitly imported. The only exception are files
// in vendor, which are never wrapped in imports and
// therefore are always executed.

// Import dependencies
//
// If you no longer want to use a dependency, remember
// to also remove its path from "config.paths.watched".
import "phoenix_html"

// Import local files
//
// Local files can be imported directly using relative
// paths "./socket" or full ones "web/static/js/socket".

import socket from "./socket"
/*
var elmDiv = document.getElementById('elm-seating-chart')
  , elmApp = Elm.SeatingChart.embed(elmDiv);
var elmWelDiv = document.getElementById('elm-welcome-pictures')
  , elmWelApp = Elm.WelcomePictures.embed(elmWelDiv);
var elmAUDiv = document.getElementById('elm-aboutus-pictures')
  , elmAUApp = Elm.AboutUsPictures.embed(elmAUDiv);
var elmEDDiv = document.getElementById('elm-eventdetails-pictures')
  , elmEDApp = Elm.EventDetailsPictures.embed(elmEDDiv);
*/

import loadView from './views/loader';

function handleDOMContentLoaded() {
    // Get the current view name
   const viewName = document.getElementsByTagName('body')[0].dataset.jsViewName

   // Load view class and mount it
   const ViewClass = loadView(viewName);
   const view = new ViewClass();
   view.main()
}

window.addEventListener('DOMContentLoaded', handleDOMContentLoaded, false);
/*
let wel_ch = socket.channel("pictures:welcome", {})

wel_ch.join()
  .receive("ok", resp => { console.log("Joined successfully", resp) })
  .receive("error", resp => { console.log("Unable to join", resp) })

wel_ch.on('set_wel_pictures', data => {
    console.log('got wel', data.pictures)
    elmWelApp.ports.pictures.send(data.pictures)
})


let au_ch = socket.channel("pictures:about_us", {})

au_ch.join()
  .receive("ok", resp => { console.log("Joined successfully", resp) })
  .receive("error", resp => { console.log("Unable to join", resp) })

au_ch.on('set_au_pictures', data => {
    console.log('got au', data.pictures),
    elmAUApp.ports.pictures.send(data.pictures)
})

let ed_ch = socket.channel("pictures:event_details", {})

ed_ch.join()
  .receive("ok", resp => { console.log("Joined successfully", resp) })
  .receive("error", resp => { console.log("Unable to join", resp) })

ed_ch.on('set_ed_pictures', data => {
    console.log('got ed', data.pictures),
    elmEDApp.ports.pictures.send(data.pictures)
}) */
