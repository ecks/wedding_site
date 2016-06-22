defmodule WeddingSite.PageController do
  use WeddingSite.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def welcome(conn, _params) do
    render conn, "welcome.html"
  end
  
  def about_us(conn, _params) do
    render conn, "about_us.html"
  end

  def registry(conn, _params) do
    render conn, "registry.html"
  end

  def seating_chart(conn, _params) do
    render conn, "seating_chart.html"
  end

  def event_details(conn, _params) do
    render conn, "event_details.html"
  end
end
