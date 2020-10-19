defmodule TaskManager.Repo.Migrations.CreateTasksTable do
  use Ecto.Migration
  alias TaskManager.EctoEnums.StatusEnum
  def change do
    StatusEnum.create_type
    create table(:tasks) do
      add :name, :string
      add :details, :string
      add :status, StatusEnum.type(), default: "incomplete"
      add :date_due, :utc_datetime
      add :prerequisite_tasks, {:array, :integer}
      timestamps()
    end

    create index(:tasks, [:prerequisite_tasks])
  end
end
