require 'simplecov'
SimpleCov.start
require 'minitest'
require 'decryptor'

class DecryptorTest < Minitest::Test
  attr_reader :decrypt

  def setup
    args = {:key => "12345", :date => 010116, :string => "o"}
    @decrypt = Decryptor.new(args)
  end

  def test_class_exists
    assert_equal Decryptor, decrypt.class
  end

  def test_date_initialize
    assert_equal (010116**2).to_s[-4..-1], decrypt.date
    #"17422276"
  end

  def test_alphabet_is_valid
    assert_equal 0, Decryptor::ALPH["a"]
    assert_equal 25, Decryptor::ALPH["z"]
    assert_equal 26, Decryptor::ALPH[" "]
  end

  def test_rotation
    assert_equal 12, decrypt.rotation(0)
  end

  def test_offset
    assert_equal 2, decrypt.offset(0)
  end

  def test_modulo
    range = 0..3
    num = 6
    assert_equal 2, decrypt.modulo(range, num)
  end

  def test_decrypt_one_letter
    assert_equal "a", decrypt.decrypt
  end

  def test_decrypt_two_letters
    args = {:key => "12345", :date => 010116, :string => "oz"}
    @decrypt = Decryptor.new(args)
    assert_equal "aa", decrypt.decrypt
  end

  def test_decrypt_three_letters
    args = {:key => "12345", :date => 010116, :string => "ozo"}
    @decrypt = Decryptor.new(args)
    assert_equal "aaa", decrypt.decrypt
  end

  def test_decrypt_four_letters
    args = {:key => "12345", :date => 010116, :string => "ozoy"}
    @decrypt = Decryptor.new(args)
    assert_equal "aaaa", decrypt.decrypt
  end

  def test_decrypt_sentence
    args = {:key => "12345", :date => 010116, :string => "ozoynzoy"}
    @decrypt = Decryptor.new(args)
    assert_equal "aaaa aaa", decrypt.decrypt
  end

end
