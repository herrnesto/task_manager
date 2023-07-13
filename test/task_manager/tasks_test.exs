defmodule TaskManager.TasksTest do
  use TaskManager.DataCase

  alias TaskManager.Tasks

  describe "tasks" do
    alias TaskManager.Tasks.Task

    import TaskManager.TasksFixtures

    @invalid_attrs %{completed_by: nil, completed_date: nil, description: nil, due_date: nil, interval: nil, name: nil}

    test "list_tasks/0 returns all tasks" do
      task = task_fixture()
      assert Tasks.list_tasks() == [task]
    end

    test "get_task!/1 returns the task with given id" do
      task = task_fixture()
      assert Tasks.get_task!(task.id) == task
    end

    test "create_task/1 with valid data creates a task" do
      valid_attrs = %{completed_by: "some completed_by", completed_date: ~U[2023-07-12 06:50:00Z], description: "some description", due_date: ~U[2023-07-12 06:50:00Z], interval: 42, name: "some name"}

      assert {:ok, %Task{} = task} = Tasks.create_task(valid_attrs)
      assert task.completed_by == "some completed_by"
      assert task.completed_date == ~U[2023-07-12 06:50:00Z]
      assert task.description == "some description"
      assert task.due_date == ~U[2023-07-12 06:50:00Z]
      assert task.interval == 42
      assert task.name == "some name"
    end

    test "create_task/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Tasks.create_task(@invalid_attrs)
    end

    test "update_task/2 with valid data updates the task" do
      task = task_fixture()
      update_attrs = %{completed_by: "some updated completed_by", completed_date: ~U[2023-07-13 06:50:00Z], description: "some updated description", due_date: ~U[2023-07-13 06:50:00Z], interval: 43, name: "some updated name"}

      assert {:ok, %Task{} = task} = Tasks.update_task(task, update_attrs)
      assert task.completed_by == "some updated completed_by"
      assert task.completed_date == ~U[2023-07-13 06:50:00Z]
      assert task.description == "some updated description"
      assert task.due_date == ~U[2023-07-13 06:50:00Z]
      assert task.interval == 43
      assert task.name == "some updated name"
    end

    test "update_task/2 with invalid data returns error changeset" do
      task = task_fixture()
      assert {:error, %Ecto.Changeset{}} = Tasks.update_task(task, @invalid_attrs)
      assert task == Tasks.get_task!(task.id)
    end

    test "delete_task/1 deletes the task" do
      task = task_fixture()
      assert {:ok, %Task{}} = Tasks.delete_task(task)
      assert_raise Ecto.NoResultsError, fn -> Tasks.get_task!(task.id) end
    end

    test "change_task/1 returns a task changeset" do
      task = task_fixture()
      assert %Ecto.Changeset{} = Tasks.change_task(task)
    end
  end
end
