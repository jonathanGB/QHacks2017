defmodule App.Taimoor do
  use App.Web, :model

  schema "tmoneys" do
    field :bugs, :integer
    field :shirtColor, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:bugs, :shirtColor])
    |> validate_required([:bugs, :shirtColor])
  end
end
