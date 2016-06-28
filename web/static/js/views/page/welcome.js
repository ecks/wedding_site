import socket from "../../socket"

export default class PageWelcomeView {
  main() {
    var elmWelDiv = document.getElementById('elm-pictures')
    , elmWelApp = Elm.Pictures.embed(elmWelDiv);

    let wel_ch = socket.channel("pictures:welcome", {})

    wel_ch.join()
      .receive("ok", resp => { console.log("Joined successfully", resp) })
      .receive("error", resp => { console.log("Unable to join", resp) })

    wel_ch.on('set_wel_pictures', data => {
      console.log('got wel', data.pictures)
      elmWelApp.ports.pictures.send(data.pictures)
    })

    wel_ch.on('set_collage', data => {
      console.log('got col', data.collage)
      elmWelApp.ports.collage.send(data.collage)
    })
  }
}
