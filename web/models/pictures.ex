defmodule WeddingSite.Pictures do
  use WeddingSite.Web, :model

  schema "pictures" do
    field :webpage, :string
    field :picture_name, :string
    field :width, :integer
    field :height, :integer

    timestamps
  end

  @required_fields ~w(webpage picture_name width height)
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

defimpl Poison.Encoder, for: WeddingSite.Pictures do
  def encode(model, opts) do
    %{id: model.id,
      webpage: model.webpage,
      pictureName: model.picture_name,
      width: model.width,
      height: model.height} |> Poison.Encoder.encode(opts)
  end
end
