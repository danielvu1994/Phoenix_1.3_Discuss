defmodule Discuss2Web.AuthController do
  use Discuss2Web, :controller
  plug Ueberauth

  alias Discuss2.Discussions
  alias Discuss2.Accounts

  def callback(%{assigns: %{ueberauth_auth: auth}} = conn, params) do
    user_params = %{token: auth.credentials.token, email: auth.info.email, provider: "github"}

    signin(conn, user_params)
  end

  defp signin(conn, user_params) do
    case insert_or_update_user(user_params) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "Welcome back!")
        # Use for cookie in Disccuss into conn
        |> put_session(:user_id, user.id)
        |> redirect(to: Routes.topic_path(conn, :index))
      {:error, _reason} ->
        conn
        |> put_flash(:error, "Error signing in")
        |> redirect(to: Routes.topic_path(conn, :index))
    end
  end

  def signout(conn, _params) do
    conn
    # Drop all infor from session
    |> configure_session(drop: true)
    |> redirect(to: Routes.topic_path(conn, :index))
  end

  defp insert_or_update_user(user_params) do
    case Accounts.get_user_by_mail(user_params) do
      nil ->
        Accounts.create_user(user_params)
      user ->
        {:ok, user}
    end
  end
end
