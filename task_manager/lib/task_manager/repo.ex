defmodule TaskManager.Repo do

@moduledoc """
  The boundary for the Task system.
  """
  use Ecto.Repo,
    otp_app: :task_manager,
    adapter: Ecto.Adapters.Postgres

  import Ecto.Query, warn: false
  alias TaskManager.Task.Task

  @default_task_pagination_limit 10

  @doc """
  Returns the list of tasks.
  ## Examples
      iex> list_tasks(%{"limit" => 10, "offset" => 0})
      [%Task{}, ...]
  """
  def list_tasks(params) do
    limit = params["limit"] || @default_task_pagination_limit
    offset = params["offset"] || 0

    from(a in Task, limit: ^limit, offset: ^offset, order_by: a.created_at)
      |> Repo.all()
  end

  @doc """
  Gets a single task.
  Raises `Ecto.NoResultsError` if the Task does not exist.
  ## Examples
      iex> get_task!(123)
      %Task{}
      iex> get_task!(456)
      ** (Ecto.NoResultsError)
  """
  def get_task!(id), do: Repo.get!(Task, id)

  def has_incomplete_prerequsite_task(task) do
    Repo.exists?(from t in Task, where: t.id in ^task.prerequisite_tasks )
  end

  @doc """
  Creates a task.
  ## Examples
      iex> create_task(%{field: value})
      {:ok, %Task{}}
      iex> create_task(%{field: bad_value})
      {:error, %Ecto.Changeset{}}
  """
  def create_task(attrs \\ %{}) do
    %Task{}
    |> Task.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a task.
  ## Examples
      iex> update_task(task, %{field: new_value})
      {:ok, %Task{}}
      iex> update_task(task, %{field: bad_value})
      {:error, %Ecto.Changeset{}}
  """
  def update_task(%Task{} = task, attrs) do
    task
    |> Task.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Task.
  ## Examples
      iex> delete_task(task)
      {:ok, %Task{}}
      iex> delete_task(task)
      {:error, %Ecto.Changeset{}}
  """
  def delete_task(id) do
    case Task |> Repo.get_by(id: id) do
      nil ->
        false

      task ->
        Repo.delete(task)
    end
  end

end
