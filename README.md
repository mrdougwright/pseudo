# Pseudo

Pseudo is a tiny library that gives you helper functions for GDPR compliance.

## Installation

The Elixir drop can be installed by adding `pseudo` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:pseudo, "~> 0.2.2"}
  ]
end
```

## Usage

You can call the `conceal/1` function on any string to pseudonymize the text for
GDPR compliance. For example:

```elixir
email = "morty@yahoo.com"
Pseudo.conceal(email)
=> "m*******@y*****.com"
```

Or for concealing names of persons.
```elixir
name = "Rick Sanchez"
Pseudo.conceal(name)
=> "R***********"
```

You can also pass formatting options. By default, the anonymized result is 7 and 5 asterisks, by using `%{format: :anonymous}`.
By passing in any other kind of format, you can replace each character in email.
```elixir
email = "morty@yahoo.com"
Pseudo.conceal(email, %{format: :each_char})
=> "m****@y****.com"
```

Docs can be found at [https://hexdocs.pm/pseudo](https://hexdocs.pm/pseudo/Pseudo.html).
