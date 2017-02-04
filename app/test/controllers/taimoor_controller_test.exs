defmodule App.TaimoorControllerTest do
  use App.ConnCase

  alias App.Taimoor
  @valid_attrs %{bugs: 42, shirtColor: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, taimoor_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing tmoneys"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, taimoor_path(conn, :new)
    assert html_response(conn, 200) =~ "New taimoor"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, taimoor_path(conn, :create), taimoor: @valid_attrs
    assert redirected_to(conn) == taimoor_path(conn, :index)
    assert Repo.get_by(Taimoor, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, taimoor_path(conn, :create), taimoor: @invalid_attrs
    assert html_response(conn, 200) =~ "New taimoor"
  end

  test "shows chosen resource", %{conn: conn} do
    taimoor = Repo.insert! %Taimoor{}
    conn = get conn, taimoor_path(conn, :show, taimoor)
    assert html_response(conn, 200) =~ "Show taimoor"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, taimoor_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    taimoor = Repo.insert! %Taimoor{}
    conn = get conn, taimoor_path(conn, :edit, taimoor)
    assert html_response(conn, 200) =~ "Edit taimoor"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    taimoor = Repo.insert! %Taimoor{}
    conn = put conn, taimoor_path(conn, :update, taimoor), taimoor: @valid_attrs
    assert redirected_to(conn) == taimoor_path(conn, :show, taimoor)
    assert Repo.get_by(Taimoor, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    taimoor = Repo.insert! %Taimoor{}
    conn = put conn, taimoor_path(conn, :update, taimoor), taimoor: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit taimoor"
  end

  test "deletes chosen resource", %{conn: conn} do
    taimoor = Repo.insert! %Taimoor{}
    conn = delete conn, taimoor_path(conn, :delete, taimoor)
    assert redirected_to(conn) == taimoor_path(conn, :index)
    refute Repo.get(Taimoor, taimoor.id)
  end
end
