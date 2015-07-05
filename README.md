# Data Noms (working title)

Data Noms will let you preview open data and tell you if it passes muster, both in its current format and any format that you care to convert it into.


## Installing

```bash
git clone git@github.com:urfolomeus/data_noms.git
cd data_noms

# fetch and install dependencies
npm install
mix deps.get, compile

# spin up a database
mix ecto.create
mix ecto.migrate
```


## Running the tests

```bash
mix test
```


## Serving

To start a server for Data Noms:

1. Make sure you carried out the previous steps and are in the project root directory
2. Start Phoenix endpoint with `mix phoenix.server`
3. Open `localhost:4000` in your browser.


## Contributing

PRs welcome. Fork the repo, make your changes, submit a PR.


## Etc

Author: Alan Gardner

License: MIT

Created during Code The City 4 out of Edinburgh.
