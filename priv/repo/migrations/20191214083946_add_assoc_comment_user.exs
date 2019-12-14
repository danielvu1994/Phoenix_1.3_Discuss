defmodule Discuss2.Repo.Migrations.AddAssocCommentUser do
  use Ecto.Migration

  def change do
    alter table(:comments)do
      add :user_id, references(:users)
    end
  end
end
