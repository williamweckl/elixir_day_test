defmodule RentACar.Vehicles.Car do
  use Ecto.Schema
  import Ecto.Changeset
  alias RentACar.Vehicles.Car


  schema "cars" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(%Car{} = car, attrs) do
    car
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
