defmodule App.User do
  use App.Web, :model

  schema "users" do
    field :fName, :string
    field :lName, :string
    field :email, :string
    field :age, :integer
    field :gender, :string
    field :lat, :float
    field :lng, :float
    field :password, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:fName, :lName, :email, :age, :gender, :lat, :lng, :password])
    |> validate_required([:fName, :lName, :email, :age, :gender, :lat, :lng, :password])
  end
end
