defmodule Discuss2Web.UserSocket do
  use Phoenix.Socket

  ## Channels
  channel "comments:*", Discuss2.CommentsChannel

  ## Transports
  transport :websocket, Phoenix.Transports.WebSocket

  def connect(%{"token" => token} = params, socket) do
    case Phoenix.Token.verify(socket, "key", token) do
      {:ok, user_id} ->
        {:ok, assign(socket, :user_id, user_id)}
      {:error, _error} ->
        :error
    end
  end

  def id(_socket), do: nil
end
