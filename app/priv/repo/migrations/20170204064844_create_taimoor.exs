defmodule App.Repo.Migrations.CreateTaimoor do
  use Ecto.Migration

  def change do
    create table(:tmoneys) do
      add :bugs, :integer
      add :shirtColor, :string

      timestamps()
    end

  end
end
