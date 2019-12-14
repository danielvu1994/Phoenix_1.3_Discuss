defmodule Discuss2.Repo.Migrations.AddAssocUserTopic do
  use Ecto.Migration
 
  def change do
     alter table(:topics)do
       add :user_id, references(:users)
     end
   end
 end
