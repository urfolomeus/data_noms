defmodule DataNoms.DataSourceTest do
  use DataNoms.ModelCase

  alias DataNoms.DataSource

  @valid_attrs %{format_type: "some content", name: "some content", url: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = DataSource.changeset(%DataSource{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = DataSource.changeset(%DataSource{}, @invalid_attrs)
    refute changeset.valid?
  end
end
