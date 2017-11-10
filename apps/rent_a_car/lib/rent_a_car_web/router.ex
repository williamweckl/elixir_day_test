defmodule RentACarWeb.Router do
  use RentACarWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", RentACarWeb do
    pipe_through :api

    resources "/cars", CarController, except: [:new, :edit]
  end
end
