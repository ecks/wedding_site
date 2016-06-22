ExUnit.start

Mix.Task.run "ecto.create", ~w(-r WeddingSite.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r WeddingSite.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(WeddingSite.Repo)

