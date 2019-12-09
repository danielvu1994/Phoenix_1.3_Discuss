defmodule Discuss2.Repo.Migrations.ChangeTopics do
  use Ecto.Migration

  def change do
    alter table(:comments)do
      add :topic_id, references(:topics)
    end
  end
end
