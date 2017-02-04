defmodule App.TaimoorTest do
  use App.ModelCase

  alias App.Taimoor

  @valid_attrs %{bugs: 42, shirtColor: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Taimoor.changeset(%Taimoor{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Taimoor.changeset(%Taimoor{}, @invalid_attrs)
    refute changeset.valid?
  end
end
