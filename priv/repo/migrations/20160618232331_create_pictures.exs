defmodule WeddingSite.Repo.Migrations.CreatePictures do
  use Ecto.Migration

  def change do
    create table(:pictures) do
      add :webpage, :string
      add :picture_name, :string
      add :width, :integer
      add :height, :integer

      timestamps
    end

  end
end
