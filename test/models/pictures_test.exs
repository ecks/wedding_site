defmodule WeddingSite.PicturesTest do
  use WeddingSite.ModelCase

  alias WeddingSite.Pictures

  @valid_attrs %{height: 42, picture_name: "some content", webpage: "some content", width: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Pictures.changeset(%Pictures{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Pictures.changeset(%Pictures{}, @invalid_attrs)
    refute changeset.valid?
  end
end
