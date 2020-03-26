defmodule PseudoTest do
  use ExUnit.Case
  doctest Pseudo

  describe "conceal/2" do
    test "for email, first character with set number of asterisks" do
      email = "gdpr_rules@gmail.com"
      assert Pseudo.conceal(email) == "g*******@g*****.com"
    end

    test "for email, can replace all but first characters" do
      email = "gdpr_rules@gmail.com"
      assert Pseudo.conceal(email, %{format: :not_anonymous}) == "g*********@g****.com"
    end

    test "for email, can handle multi dot domains" do
      email = "peter@hotmail.co.uk"
      assert Pseudo.conceal(email) == "p*******@h*****.co.uk"
    end

    test "for string, replaces all but first character with asterisks" do
      name = "rick sanchez"
      assert Pseudo.conceal(name) == "r***********"
    end

    test "for string, correctly obfuscates usernames with @ symbols" do
      username = "Mr.H@ndy"
      assert Pseudo.conceal(username) == "M*******"
    end
  end
end
