import socket from "../../socket"

export default class PageEvent_detailsView {
  main() {
    var elmEDDiv = document.getElementById('elm-pictures')
      , elmEDApp = Elm.Pictures.embed(elmEDDiv);

    let ed_ch = socket.channel("pictures:event_details", {})

    ed_ch.join()
      .receive("ok", resp => { console.log("Joined successfully", resp) })
      .receive("error", resp => { console.log("Unable to join", resp) })

    ed_ch.on('set_ed_pictures', data => {
        console.log('got ed', data.pictures),
        elmEDApp.ports.pictures.send(data.pictures)
    })
    
    ed_ch.on('set_collage', data => {
      console.log('got col', data.collage)
      elmEDApp.ports.collage.send(data.collage)
    })
  }
}
