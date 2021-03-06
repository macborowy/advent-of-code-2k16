Code.load_file("code.exs")
ExUnit.start
ExUnit.configure trace: true

defmodule ModuleTest do
  use ExUnit.Case

  test "the truth" do
    assert 1 == 1
  end

  describe "acceptance tests" do
    test "for secret abcdef the answer is 609043" do
      secret = "abcdef"
      answer = 609043

      assert answer == Miner.find_answer(secret, "00000", answer - 10)
    end

    test "for secret pqrstuv the answer is 1048970" do
      secret = "pqrstuv"
      answer = 1048970

      assert answer == Miner.find_answer(secret, "00000", answer - 10)
    end
  end
end
