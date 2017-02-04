defmodule App.UserTest do
  use App.ModelCase

  alias App.User

  @valid_attrs %{age: 42, email: "some content", fName: "some content", gender: "some content", lName: "some content", lat: "120.5", lng: "120.5", password: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = User.changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end
end
