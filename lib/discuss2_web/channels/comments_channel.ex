defmodule Discuss2.CommentsChannel do
  use Discuss2Web, :channel

  alias Discuss2.Discussions
  alias Discuss2.Discussions.Comment

  import Ecto

  def join("comments:" <> topic_id, _params, socket) do
    topic_id = String.to_integer(topic_id)
    topic = Discussions.get_topic!(topic_id)

    {:ok, %{}, assign(socket, :topic, topic)}
  end

  def handle_in(name, %{"content" => content}, socket) do
    topic = socket.assigns.topic

    # changeset =
    #   topic
    #   # this will push topic_id in comment?
    #   # and mark this comment belong to this topic?
    #   |> build_assoc(:comments)
    #   |> Comment.changeset(%{content: content})

    # IO.inspect(changeset)
    Discussions.create_comment(%{"content" => content}, topic)
    {:reply, :ok, socket}
  end
end
