defmodule TaskManager.DatabaseSeeder do
  @moduledoc """
  Script for populating the database. You can run it as:

      mix run priv/repo/seeds.exs

  Inside the script, you can read and write to any of your
  repositories directly:

      TaskManager.Repo.insert!(%TaskManager.SomeSchema{})

  We recommend using the bang functions (`insert!`, `update!`
  and so on) as they will fail if something goes wrong.
  """
  alias TaskManager.Repo
  alias TaskManager.Task.Task

  # Clear the database first before seeding
  Repo.delete_all Task

  Repo.insert! %Task{
    name: "Task 1"
  }

  Repo.insert! %Task{
    name: "Task 2"
  }

  Repo.insert! %Task{
    name: "Task 3"
  }
end
