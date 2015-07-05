defmodule DataNoms.Repo.Migrations.CreateDataSource do
  use Ecto.Migration

  def change do
    create table(:data_sources) do
      add :name, :string
      add :url, :string
      add :format_type, :string

      timestamps
    end

  end
end
