defmodule Discuss2.Discussions.Comment do
  use Ecto.Schema
  import Ecto.Changeset

  alias Discuss2.Discussions.Topic
  alias Discuss2.Discussions.User

  @derive {Jason.Encoder, only: [:content]}

  schema "comments" do
    field :content, :string
    belongs_to :topic, Topic
    belongs_to :user, User

    timestamps()
  end

  @doc false
  def changeset(comment, attrs) do
    comment
    |> cast(attrs, [:content])
    |> validate_required([:content])
  end
end
