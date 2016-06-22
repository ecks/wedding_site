# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     WeddingSite.Repo.insert!(%WeddingSite.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
WeddingSite.Repo.insert!(%WeddingSite.Pictures{webpage: "Welcome", picture_name: "images/welcome1.jpg", width: 375, height: 500})
WeddingSite.Repo.insert!(%WeddingSite.Pictures{webpage: "Welcome", picture_name: "images/welcome2.jpg", width: 500, height: 375})
WeddingSite.Repo.insert!(%WeddingSite.Pictures{webpage: "Welcome", picture_name: "images/welcome3.png", width: 480, height: 480})
WeddingSite.Repo.insert!(%WeddingSite.Pictures{webpage: "Welcome", picture_name: "images/welcome4.jpg", width: 375, height: 500})

WeddingSite.Repo.insert!(%WeddingSite.Pictures{webpage: "AboutUs", picture_name: "images/about_us1.jpg", width: 250, height: 187})
WeddingSite.Repo.insert!(%WeddingSite.Pictures{webpage: "AboutUs", picture_name: "images/about_us2.jpeg", width: 250, height: 187})
WeddingSite.Repo.insert!(%WeddingSite.Pictures{webpage: "AboutUs", picture_name: "images/about_us3.jpg", width: 140, height: 250})
WeddingSite.Repo.insert!(%WeddingSite.Pictures{webpage: "AboutUs", picture_name: "images/about_us4.jpg", width: 250, height: 187})

WeddingSite.Repo.insert!(%WeddingSite.Pictures{webpage: "EventDetails", picture_name: "images/event_details1.jpg", width: 250, height: 145})
WeddingSite.Repo.insert!(%WeddingSite.Pictures{webpage: "EventDetails", picture_name: "images/event_details2.jpg", width: 250, height: 145})
