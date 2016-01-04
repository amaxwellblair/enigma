require 'simplecov'
SimpleCov.start
require 'minitest'
require 'crack'
require 'decryptor'

class CrackTest < Minitest::Test
  attr_reader :spy

  def setup
    args = {:date => 010116}
    @spy = Crack.new("ozoynzoynrvbncaa", Decryptor.new(args))
  end

  def test_class_exists
    assert_equal Crack, spy.class
  end

  def test_key_finder
    assert_equal "12345", spy.key_finder
  end

  def test_crack_code
    assert_equal "aaaa aaa the end", spy.code_breaker
  end

end
