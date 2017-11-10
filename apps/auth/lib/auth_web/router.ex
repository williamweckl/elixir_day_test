defmodule AuthWeb.Router do
  use AuthWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/" do
    pipe_through :api

    resources "/users", AuthWeb.UserController, except: [:new, :edit]
    forward "/rent_a_car", RentACarWeb.Router
  end
end
