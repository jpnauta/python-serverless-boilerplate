# Python Serverless Boilerplate

> Boilerplate for Python + Serverless

## Features

- `Docker` and `serverless-offline` for easy local development
- `tox` and `pytest` for easy testing
- `pylint` and `flake8` to maintain clean code
- `make` to simplify various commands

## Local Usage

To run this project locally, it is recommended that you use `Docker Compose` and `make`.

To run a local server, use the `start` command.

```
make start
```

To run unit tests, use the `test` command.

```
make test
```

To turn off any running docker images, use the `clean` command.

```
make clean
```