defmodule Discuss2Web.PageController do
  use Discuss2Web, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
