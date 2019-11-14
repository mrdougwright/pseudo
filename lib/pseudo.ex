defmodule Pseudo do
  @moduledoc """
  The Pseudo library will obfuscate names and emails for GDPR compliance.
  """

  @doc """
  Conceal will change characters of email for GDPR compliance.

  ## Examples
      iex> email = "rick_and_morty@gmail.com"
      iex> Pseudo.conceal(email)
      "r*******@g*****.com"
  """
  def conceal(string, options \\ %{format: :anonymous})

  def conceal(string, options) do
    case String.contains?(string, "@") do
      true -> conceal_email(string, options)
      false -> conceal_text(string)
    end
  end

  defp conceal_email(email, %{format: :anonymous}) do
    [name, domain] = String.split(email, "@")
    [_, top_level] = String.split(domain, ".")
    {first_char, _} = String.split_at(name, 1)
    {email_char, _} = String.split_at(domain, 1)
    "#{first_char}*******@#{email_char}*****.#{top_level}"
  end

  defp conceal_email(email, _) do
    [name, domain] = String.split(email, "@")
    [name_level, top_level] = String.split(domain, ".")
    "#{conceal_text(name)}@#{conceal_text(name_level)}.#{top_level}"
  end

  defp conceal_text(text) do
    {first_char, rest} = String.split_at(text, 1)
    first_char <> String.replace(rest, ~r(.), "*")
  end
end
