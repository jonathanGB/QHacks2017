defmodule App.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :fName, :string
      add :lName, :string
      add :email, :string
      add :age, :integer
      add :gender, :string
      add :lat, :float
      add :lng, :float
      add :password, :string

      timestamps()
    end

  end
end
