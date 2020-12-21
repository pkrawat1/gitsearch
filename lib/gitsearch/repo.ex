defmodule Gitsearch.Repo do
  use Ecto.Repo,
    otp_app: :gitsearch,
    adapter: Ecto.Adapters.Postgres
end
