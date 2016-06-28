import socket from "../../socket"

export default class PageAbout_usView {
  main() {
    var elmAuDiv = document.getElementById('elm-pictures')
    , elmAuApp = Elm.Pictures.embed(elmAuDiv);

    let au_ch = socket.channel("pictures:about_us", {})

    au_ch.join()
      .receive("ok", resp => { console.log("Joined successfully", resp) })
      .receive("error", resp => { console.log("Unable to join", resp) })

    au_ch.on('set_au_pictures', data => {
        console.log('got au', data.pictures),
        elmAuApp.ports.pictures.send(data.pictures)
    })

    au_ch.on('set_collage', data => {
      console.log('got col', data.collage)
      elmAuApp.ports.collage.send(data.collage)
    })

  }
}
