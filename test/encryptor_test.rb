require 'simplecov'
SimpleCov.start
require 'minitest'
require 'encryptor'

class EncryptorTest < Minitest::Test
  attr_reader :encrypt

  def setup
    args = {:key => "12345", :date => 010116, :string => "a"}
    @encrypt = Encryptor.new(args)
  end

  def test_class_exists
    assert_equal Encryptor, encrypt.class
  end

  def test_date_initialize
    assert_equal (010116**2).to_s[-4..-1], encrypt.date
    #"17422276"
  end

  def test_alphabet_is_valid
    assert_equal 0, Encryptor::ALPH["a"]
    assert_equal 25, Encryptor::ALPH["z"]
    assert_equal 26, Encryptor::ALPH[" "]
  end

  def test_rotation
    assert_equal 12, encrypt.rotation(0)
  end

  def test_offset
    assert_equal 2, encrypt.offset(0)
  end

  def test_modulo
    range = 0..3
    num = 6
    assert_equal 2, encrypt.modulo(range, num)
  end

  def test_encrypt_one_letter
    assert_equal "o", encrypt.encrypt
  end

  def test_encrypt_two_letters
    args = {:key => "12345", :date => 010116, :string => "aa"}
    @encrypt = Encryptor.new(args)
    assert_equal "oz", encrypt.encrypt
  end

  def test_encrypt_three_letters
    args = {:key => "12345", :date => 010116, :string => "aaa"}
    @encrypt = Encryptor.new(args)
    assert_equal "ozo", encrypt.encrypt
  end

  def test_encrypt_four_letters
    args = {:key => "12345", :date => 010116, :string => "aaaa"}
    @encrypt = Encryptor.new(args)
    assert_equal "ozoy", encrypt.encrypt
  end

  def test_encrypt_sentence
    args = {:key => "12345", :date => 010116, :string => "aaaa aaa"}
    @encrypt = Encryptor.new(args)
    assert_equal "ozoynzoy", encrypt.encrypt
  end

  # def test_encrypt_sentences
  #   args = {:key => "12345", :date => 010116, :string => "aaaa aaa the end"}
  #   @encrypt = Encryptor.new(args)
  #   assert_equal "ozoynzoy", encrypt.encrypt
  # end

end
