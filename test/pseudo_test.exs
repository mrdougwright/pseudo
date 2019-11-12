defmodule PseudoTest do
  use ExUnit.Case
  doctest Pseudo

  describe "conceal/2" do
    test "for email, replaces all but first character and domain with asteriks" do
      email = "gdpr_rules@gmail.com"
      assert Pseudo.conceal(email) == "g*********@g****.com"
    end

    test "for string, replaces all but first character with asteriks" do
      name = "rick sanchez"
      assert Pseudo.conceal(name) == "r***********"
    end
  end
end
