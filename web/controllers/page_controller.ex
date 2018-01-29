defmodule Project4.PageController do
  use Project4.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
