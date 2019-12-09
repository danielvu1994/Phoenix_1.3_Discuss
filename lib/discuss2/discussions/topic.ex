defmodule Discuss2.Discussions.Topic do
  use Ecto.Schema
  import Ecto.Changeset

  alias Discuss2.Discussions.Comment

  schema "topics" do
    field :title, :string
    has_many :comments, Comment

    timestamps()
  end

  @doc false
  def changeset(topic, attrs) do
    topic
    |> cast(attrs, [:title])
    |> validate_required([:title])
  end
end
