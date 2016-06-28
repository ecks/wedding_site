defmodule WeddingSite.Collage do
  use WeddingSite.Web, :model

  schema "collages" do
    field :webpage, :string
    field :c_width, :integer
    field :c_height, :integer

    timestamps
  end

  @required_fields ~w(webpage c_width c_height)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end

defimpl Poison.Encoder, for: WeddingSite.Collage do
  def encode(model, opts) do
    %{id: model.id,
      webpage: model.webpage,
      cWidth: model.c_width,
      cHeight: model.c_height} |> Poison.Encoder.encode(opts)
  end
end
