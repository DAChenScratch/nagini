# Nagini

Nagini is a snake who battles at: http://battlesnake.io

## Getting Started

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Start Phoenix endpoint with `mix phx.server`

Now you can use [`localhost:4000`](http://localhost:4000) as a Battlesnake
endpoint.

To modify snake configuration, edit `config/battlesnake.exs`.

The logger is configured to log at the debug level (very verbose) and logs are
stored in `/tmp/nagini.log`. This is a workaround for Nanobox stdout log
streaming being broken.

## Development with Nanobox

  * Install Docker
  * Install Nanobox CLI and log in
  * `nanobox dns add local nagini.local`
  * `nanobox run`

Note that Nanobox's Elixir engine may run a different version of Elixir than
this project's .tool-versions lock file expects. This may not behave as
intended.

## Deployment with Nanobox

Test with a dry-run first:

  * `nanobox evar add dry-run MIX_ENV=prod PORT=8080`
  * `nanobox evar add dry-run APPSIGNAL_APP_NAME="Nagini" APPSIGNAL_APP_ENV="dry-run" APPSIGNAL_PUSH_API_KEY="FIXME"`
  * `nanobox deploy dry-run`
  * Test the dry-run deployed endpoint

Update the release version:

  * Edit `mix.exs`

Deploy:

  * `nanobox remote add app-name`
  * `nanobox evar add app-name MIX_ENV=prod PORT=8080`
  * `nanobox evar add app-name APPSIGNAL_APP_NAME="Nagini" APPSIGNAL_APP_ENV="prod" APPSIGNAL_PUSH_API_KEY="FIXME"`
  * `nanobox deploy`

## Monitoring

Monitoring is set up to work with AppSignal if the environment is configured.

To read the Nanobox server logs:

  * `nanobox console app-name web.main`
  * `tail -f /tmp/nagini.log`

## License

Copyright 2019 Justin Workman. All Rights Reserved.
