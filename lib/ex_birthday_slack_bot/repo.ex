defmodule ExBirthdaySlackBot.Repo do
  use Ecto.Repo,
    otp_app: :ex_birthday_slack_bot,
    adapter: Ecto.Adapters.Postgres
end
