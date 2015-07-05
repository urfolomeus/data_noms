defmodule DataNoms.DataSourceControllerTest do
  use DataNoms.ConnCase

  alias DataNoms.DataSource
  @valid_attrs %{format_type: "some content", name: "some content", url: "some content"}
  @invalid_attrs %{}

  setup do
    conn = conn()
    {:ok, conn: conn}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, data_source_path(conn, :index)
    assert html_response(conn, 200) =~ "Data sources"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, data_source_path(conn, :new)
    assert html_response(conn, 200) =~ "New data source"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, data_source_path(conn, :create), data_source: @valid_attrs
    assert redirected_to(conn) == data_source_path(conn, :index)
    assert Repo.get_by(DataSource, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, data_source_path(conn, :create), data_source: @invalid_attrs
    assert html_response(conn, 200) =~ "New data source"
  end

  test "shows chosen resource", %{conn: conn} do
    data_source = Repo.insert! %DataSource{name: "Test source", url: "/test/url"}
    conn = get conn, data_source_path(conn, :show, data_source)
    assert html_response(conn, 200) =~ "Test source"
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    data_source = Repo.insert! %DataSource{}
    conn = get conn, data_source_path(conn, :edit, data_source)
    assert html_response(conn, 200) =~ "Edit data source"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    data_source = Repo.insert! %DataSource{}
    conn = put conn, data_source_path(conn, :update, data_source), data_source: @valid_attrs
    assert redirected_to(conn) == data_source_path(conn, :index)
    assert Repo.get_by(DataSource, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    data_source = Repo.insert! %DataSource{}
    conn = put conn, data_source_path(conn, :update, data_source), data_source: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit data source"
  end

  test "deletes chosen resource", %{conn: conn} do
    data_source = Repo.insert! %DataSource{}
    conn = delete conn, data_source_path(conn, :delete, data_source)
    assert redirected_to(conn) == data_source_path(conn, :index)
    refute Repo.get(DataSource, data_source.id)
  end
end
