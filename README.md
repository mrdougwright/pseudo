# Pseudo

Pseudo is a tiny library that gives you helper functions for GDPR compliance.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `pseudo` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:pseudo, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/pseudo](https://hexdocs.pm/pseudo).

## Usage

You can call the `conceal/1` function on any string to pseudonymize the text for
GDPR compliance. For example,

```elixir
email = "morty@yahoo.com"
Pseudo.conceal(email)
=> "m****@yahoo.com"
```

Or for concealing names of persons.
```elixir
name = "Rick Sanchez"
Pseudo.conceal(name)
=> "R***********"
```

Docs can be found at [https://hexdocs.pm/pseudo](https://hexdocs.mp/pseudo)
