defmodule WeddingSite.Router do
  use WeddingSite.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", WeddingSite do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :welcome
    get "/about_us", PageController, :about_us
    get "/registry", PageController, :registry
    get "/seating_chart", PageController, :seating_chart
    get "/event_details", PageController, :event_details
  end

  # Other scopes may use custom stacks.
  # scope "/api", WeddingSite do
  #   pipe_through :api
  # end
end
