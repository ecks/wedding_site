defmodule WeddingSite.PicturesChannel do
  use WeddingSite.Web, :channel

  def join("pictures:welcome", payload, socket) do
    if authorized?(payload) do
      send self(), :after_wel_join
      {:ok, socket}
    else
      {:error, %{reason: "unauthorized"}}
    end
  end

  def join("pictures:about_us", payload, socket) do
    if authorized?(payload) do
      send self(), :after_au_join
      {:ok, socket}
    else
      {:error, %{reason: "unauthorized"}}
    end
  end

  def join("pictures:event_details", payload, socket) do
    if authorized?(payload) do
      send self(), :after_ed_join
      {:ok, socket}
    else
      {:error, %{reason: "unauthorized"}}
    end
  end


  # Channels can be used in a request/response fashion
  # by sending replies to requests from the client
  def handle_in("ping", payload, socket) do
    {:reply, {:ok, payload}, socket}
  end

  # It is also common to receive messages from the client and
  # broadcast to everyone in the current topic (pictures:lobby).
  def handle_in("shout", payload, socket) do
    broadcast socket, "shout", payload
    {:noreply, socket}
  end

  # This is invoked every time a notification is being broadcast
  # to the client. The default implementation is just to push it
  # downstream but one could filter or change the event.
  def handle_out(event, payload, socket) do
    push socket, event, payload
    {:noreply, socket}
  end

  # with select did not work, needs to return an Object
  # For reference: select: [p.picture_name, p.width, p.height]
  def handle_info(:after_wel_join, socket) do
    pictures = (from p in WeddingSite.Pictures, order_by: [asc: p.id], where: p.webpage == "Welcome") |> Repo.all
    push socket, "set_wel_pictures", %{pictures: pictures}
    {:noreply, socket}
  end 

  def handle_info(:after_au_join, socket) do
    pictures = (from p in WeddingSite.Pictures, order_by: [asc: p.id], where: p.webpage == "AboutUs") |> Repo.all
    push socket, "set_au_pictures", %{pictures: pictures}

    {:noreply, socket}
  end 

  def handle_info(:after_ed_join, socket) do
    pictures = (from p in WeddingSite.Pictures, order_by: [asc: p.id], where: p.webpage == "EventDetails") |> Repo.all
    push socket, "set_ed_pictures", %{pictures: pictures}

    {:noreply, socket}
  end 

  # Add authorization logic here as required.
  defp authorized?(_payload) do
    true
  end
end
