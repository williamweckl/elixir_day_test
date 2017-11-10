defmodule RentACar.Repo do
  use Ecto.Repo, otp_app: :rent_a_car

  @doc """
  Dynamically loads the repository url from the
  DATABASE_URL environment variable.
  """
  def init(_, opts) do
    {:ok, Keyword.put(opts, :url, System.get_env("RENT_A_CAR_DATABASE_URL"))}
  end
end
