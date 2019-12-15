defmodule Discuss2.Discussions.Topic do
  use Ecto.Schema
  import Ecto.Changeset

  alias Discuss2.Discussions.Comment
  alias Discuss2.Discussions.User

  schema "topics" do
    field :title, :string
    has_many :comments, Comment, on_delete: :delete_all
    belongs_to :user, User

    timestamps()
  end

  @doc false
  def changeset(topic, attrs) do
    topic
    |> cast(attrs, [:title])
    |> validate_required([:title])
  end
end
