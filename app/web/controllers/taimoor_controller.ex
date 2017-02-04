defmodule App.TaimoorController do
  use App.Web, :controller

  alias App.Taimoor

  def index(conn, _params) do
    tmoneys = Repo.all(Taimoor)
    render(conn, "index.html", tmoneys: tmoneys)
  end

  def new(conn, _params) do
    changeset = Taimoor.changeset(%Taimoor{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"taimoor" => taimoor_params}) do
    changeset = Taimoor.changeset(%Taimoor{}, taimoor_params)

    case Repo.insert(changeset) do
      {:ok, _taimoor} ->
        conn
        |> put_flash(:info, "Taimoor created successfully.")
        |> redirect(to: taimoor_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    taimoor = Repo.get!(Taimoor, id)
    render(conn, "show.html", taimoor: taimoor)
  end

  def edit(conn, %{"id" => id}) do
    taimoor = Repo.get!(Taimoor, id)
    changeset = Taimoor.changeset(taimoor)
    render(conn, "edit.html", taimoor: taimoor, changeset: changeset)
  end

  def update(conn, %{"id" => id, "taimoor" => taimoor_params}) do
    taimoor = Repo.get!(Taimoor, id)
    changeset = Taimoor.changeset(taimoor, taimoor_params)

    case Repo.update(changeset) do
      {:ok, taimoor} ->
        conn
        |> put_flash(:info, "Taimoor updated successfully.")
        |> redirect(to: taimoor_path(conn, :show, taimoor))
      {:error, changeset} ->
        render(conn, "edit.html", taimoor: taimoor, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    taimoor = Repo.get!(Taimoor, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(taimoor)

    conn
    |> put_flash(:info, "Taimoor deleted successfully.")
    |> redirect(to: taimoor_path(conn, :index))
  end
end
