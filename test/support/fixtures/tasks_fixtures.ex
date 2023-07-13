defmodule TaskManager.TasksFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `TaskManager.Tasks` context.
  """

  @doc """
  Generate a task.
  """
  def task_fixture(attrs \\ %{}) do
    {:ok, task} =
      attrs
      |> Enum.into(%{
        completed_by: "some completed_by",
        completed_date: ~U[2023-07-12 06:50:00Z],
        description: "some description",
        due_date: ~U[2023-07-12 06:50:00Z],
        interval: 42,
        name: "some name"
      })
      |> TaskManager.Tasks.create_task()

    task
  end
end
