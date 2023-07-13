defmodule TaskManager.Tasks.Task do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tasks" do
    field :completed_by, :string
    field :completed_date, :utc_datetime
    field :description, :string
    field :due_date, :utc_datetime
    field :interval, :integer
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(task, attrs) do
    task
    |> cast(attrs, [:interval, :name, :description, :due_date, :completed_date, :completed_by])
    |> validate_required([:interval, :name, :description, :due_date, :completed_date, :completed_by])
  end
end
