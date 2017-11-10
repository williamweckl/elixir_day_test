defmodule RentACar.Repo.Migrations.CreateCars do
  use Ecto.Migration

  def change do
    create table(:cars) do
      add :name, :string

      timestamps()
    end

  end
end
