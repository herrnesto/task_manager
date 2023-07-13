defmodule TaskManager.Repo.Migrations.CreateTasks do
  use Ecto.Migration

  def change do
    create table(:tasks) do
      add :interval, :integer
      add :name, :string
      add :description, :string
      add :due_date, :utc_datetime
      add :completed_date, :utc_datetime
      add :completed_by, :string

      timestamps()
    end
  end
end
