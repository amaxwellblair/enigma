require 'simplecov'
SimpleCov.start
require 'minitest'
require 'encryptor'

class EncryptorTest < Minitest::test
  attr_reader :encrypt

  def setup
    args = {key: "12345", date: 010116, string: "hola"}
    @encrypt = Encryptor.new(args)
  end

  def test_class_exists
    skip
    assert_equal Encryptor, encrypt.class
  end

  def test_date_initialize
    assert_equal 010116**2[-4..-1], encrypt.date
  end

  def 

end
