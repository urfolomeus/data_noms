defmodule DataNoms.DataSourceController do
  use DataNoms.Web, :controller

  alias DataNoms.DataSource

  plug :scrub_params, "data_source" when action in [:create, :update]
  plug :action

  def index(conn, _params) do
    data_sources = Repo.all(DataSource)
    render(conn, "index.html", data_sources: data_sources)
  end

  def new(conn, _params) do
    changeset = DataSource.changeset(%DataSource{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"data_source" => data_source_params}) do
    changeset = DataSource.changeset(%DataSource{}, data_source_params)

    if changeset.valid? do
      Repo.insert(changeset)

      conn
      |> put_flash(:info, "DataSource created successfully.")
      |> redirect(to: data_source_path(conn, :index))
    else
      render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    data_source = Repo.get(DataSource, id)
    render(conn, "show.html", data_source: data_source)
  end

  def edit(conn, %{"id" => id}) do
    data_source = Repo.get(DataSource, id)
    changeset = DataSource.changeset(data_source)
    render(conn, "edit.html", data_source: data_source, changeset: changeset)
  end

  def update(conn, %{"id" => id, "data_source" => data_source_params}) do
    data_source = Repo.get(DataSource, id)
    changeset = DataSource.changeset(data_source, data_source_params)

    if changeset.valid? do
      Repo.update(changeset)

      conn
      |> put_flash(:info, "DataSource updated successfully.")
      |> redirect(to: data_source_path(conn, :index))
    else
      render(conn, "edit.html", data_source: data_source, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    data_source = Repo.get(DataSource, id)
    Repo.delete(data_source)

    conn
    |> put_flash(:info, "DataSource deleted successfully.")
    |> redirect(to: data_source_path(conn, :index))
  end
end
