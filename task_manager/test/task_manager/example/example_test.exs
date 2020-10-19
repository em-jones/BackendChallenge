defmodule TaskManager.TaskRepoTest do
  use TaskManager.DataCase

  alias TaskManager.TaskRepo

  describe "tasks" do
    alias TaskManager.Task.{Task, TaskRepo}

    @valid_attrs %{name: "some name", status: :incomplete}
    @update_attrs %{name: "some updated name", status: :complete}
    @invalid_attrs %{name: nil}

    def task_fixture(attrs \\ %{}) do
      {:ok, task} =
        attrs
        |> Enum.into(@valid_attrs)
        |> TaskRepo.create_task()

      task
    end

    test "list_tasks/0 returns all tasks" do
      task = task_fixture()
      assert TaskRepo.list_tasks() == [task]
    end

    test "get_task!/1 returns the task with given id" do
      task = task_fixture()
      assert TaskRepo.get_task!(task.id) == task
    end

    test "create_task/1 with valid data creates a task" do
      assert {:ok, %Language{} = task} = TaskRepo.create_task(@valid_attrs)
      assert task.name == "some name"
      assert task.proverb == "some proverb"
    end

    test "create_task/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = TaskRepo.create_task(@invalid_attrs)
    end

    test "update_task/2 with valid data updates the task" do
      task = task_fixture()
      assert {:ok, %Language{} = task} = TaskRepo.update_task(task, @update_attrs)
      assert task.name == "some updated name"
      assert task.proverb == "some updated proverb"
    end

    test "update_task/2 with invalid data returns error changeset" do
      task = task_fixture()
      assert {:error, %Ecto.Changeset{}} = TaskRepo.update_task(task, @invalid_attrs)
      assert task == TaskRepo.get_task!(task.id)
    end

    test "delete_task/1 deletes the task" do
      task = task_fixture()
      assert {:ok, %Language{}} = TaskRepo.delete_task(task)
      assert_raise Ecto.NoResultsError, fn -> TaskRepo.get_task!(task.id) end
    end

    test "change_task/1 returns a task changeset" do
      task = task_fixture()
      assert %Ecto.Changeset{} = TaskRepo.change_task(task)
    end
  end
end
