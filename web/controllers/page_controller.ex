defmodule DataNoms.PageController do
  use DataNoms.Web, :controller

  plug :action

  def index(conn, _params) do
    render conn, "index.html"
  end
end
