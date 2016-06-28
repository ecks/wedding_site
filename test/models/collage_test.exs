defmodule WeddingSite.CollageTest do
  use WeddingSite.ModelCase

  alias WeddingSite.Collage

  @valid_attrs %{c_height: 42, c_width: 42, webpage: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Collage.changeset(%Collage{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Collage.changeset(%Collage{}, @invalid_attrs)
    refute changeset.valid?
  end
end
