defmodule TaskManager.Task.Task do
  use Ecto.Schema
  import Ecto.Changeset
  alias TaskManager.EctoEnums.StatusEnum

  schema "tasks" do
    field :status, StatusEnum, default: :incomplete
    field :name, :string
    field :details, :string
    field :date_due, :integer
    timestamps()
  end

  @doc false
  def changeset(task, attrs) do
    task
    |> cast(attrs, [:name])
    |> validate_required([:name])
    |> validate_exclusion(:status, ~w(locked)a)
  end
end
