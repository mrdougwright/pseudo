defmodule Pseudo do
  @moduledoc """
  The Pseudo library will obfuscate names and emails for GDPR compliance.
  """

  @doc """
  Conceal will change characters of email for GDPR compliance.

  ## Examples
      iex> email = "rick_and_morty@gmail.com"
      iex> Pseudo.conceal(email)
      "r*************@gmail.com"
  """
  def conceal(string) do
    case String.contains?(string, "@") do
      true -> conceal_email(string)
      false -> conceal_text(string)
    end
  end

  defp conceal_email(email) do
    [name, domain] = String.split(email, "@")
    {first_char, obfuscated} = obfuscate(name)
    "#{first_char}#{obfuscated}@#{domain}"
  end

  defp conceal_text(text) do
    {first_char, obfuscated} = obfuscate(text)
    "#{first_char}#{obfuscated}"
  end

  defp obfuscate(text) do
    {first_char, rest} = String.split_at(text, 1)
    {first_char, String.replace(rest, ~r(.), "*")}
  end
end
