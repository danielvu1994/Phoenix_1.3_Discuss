defmodule Discuss2.Plugs.SetUser do
  import Plug.Conn
  import Phoenix.Controller

  alias Discuss2.Repo
  alias Discuss2.Accounts
  alias Discuss2.Router.Helpers

  def init(_params) do

  end

  def call(conn, _params) do
    # Get session in cookie
    user_id = get_session(conn, :user_id)

    cond do
      # will get user from get, double check?
      user = user_id && Accounts.get_user!(user_id)->
        assign(conn, :user, user)
      true ->
        assign(conn, :user, nil)
    end
  end
end
