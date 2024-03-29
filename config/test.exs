use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :data_noms, DataNoms.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :data_noms, DataNoms.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "ecto",
  password: "ecto",
  database: "data_noms_test",
  size: 1, # Use a single connection for transactional tests
  pool: Ecto.Adapters.SQL.Sandbox
