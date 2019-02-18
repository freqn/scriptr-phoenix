defmodule Scriptr.Repo do
  use Ecto.Repo,
    otp_app: :scriptr,
    adapter: Ecto.Adapters.Postgres
end
