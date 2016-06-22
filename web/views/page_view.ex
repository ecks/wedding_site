defmodule WeddingSite.PageView do
  use WeddingSite.Web, :view

  def hristo_wishlist do
    [%{ "url" => "http://www.straightrazordesigns.com/index.php?main_page=product_info&cPath=126_44&products_id=860", "name" => "Straight Razor"}, %{ "url" => "https://www.youtube.com/watch?v=Q4VGQPk2Dl8", "name" => "Electric Car"}]
  end

  def leslie_wishlist do
    "Mattress"
  end
end
