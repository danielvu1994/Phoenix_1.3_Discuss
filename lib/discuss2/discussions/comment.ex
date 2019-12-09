defmodule Discuss2.Discussions.Comment do
  use Ecto.Schema
  import Ecto.Changeset

  alias Discuss2.Discussions.Topic

  schema "comments" do
    field :content, :string
    belongs_to :topic, Topic

    timestamps()
  end

  @doc false
  def changeset(comment, attrs) do
    comment
    |> cast(attrs, [:content])
    |> validate_required([:content])
  end
end
