defmodule WeddingSite.Repo.Migrations.CreateCollage do
  use Ecto.Migration

  def change do
    create table(:collages) do
      add :webpage, :string
      add :c_width, :integer
      add :c_height, :integer

      timestamps
    end

  end
end
