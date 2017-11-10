defmodule RentACarWeb.CarController do
  use RentACarWeb, :controller

  alias RentACar.Vehicles
  alias RentACar.Vehicles.Car

  action_fallback RentACarWeb.FallbackController

  def index(conn, _params) do
    cars = Vehicles.list_cars()
    render(conn, "index.json", cars: cars)
  end

  def create(conn, %{"car" => car_params}) do
    with {:ok, %Car{} = car} <- Vehicles.create_car(car_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", car_path(conn, :show, car))
      |> render("show.json", car: car)
    end
  end

  def show(conn, %{"id" => id}) do
    car = Vehicles.get_car!(id)
    render(conn, "show.json", car: car)
  end

  def update(conn, %{"id" => id, "car" => car_params}) do
    car = Vehicles.get_car!(id)

    with {:ok, %Car{} = car} <- Vehicles.update_car(car, car_params) do
      render(conn, "show.json", car: car)
    end
  end

  def delete(conn, %{"id" => id}) do
    car = Vehicles.get_car!(id)
    with {:ok, %Car{}} <- Vehicles.delete_car(car) do
      send_resp(conn, :no_content, "")
    end
  end
end
