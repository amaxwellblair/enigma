$LOAD_PATH.unshift(__dir__)
require 'pry'
require 'alphabet'

class Decryptor
  include Alphabet
  attr_accessor :key, :date, :string

  def initialize(args = {})
    @key = args.fetch(:key, "00000")
    @date = date_initialize(args.fetch(:date, "000000"))
    @string = args.fetch(:string, "you did not input a string")
  end

  def date_initialize(date)
    (date**2).to_s[-4..-1]
  end

  def modulo(range, num)
    if num > range.last
      modulo(range, num - (range.count))
    elsif num < range.first
      modulo(range, num + (range.count))
    else
      num
    end
  end

  def decrypt
    string.chars.map.with_index do |chr, i|
      k = ALPH[chr] - rotation(modulo(0..3, i)) - offset(modulo(0..3, i))
      NUM[modulo(0..ALPH.length - 1, k)]
    end.join
  end

  def rotation(index)
    key[index..index+1].to_i
  end

  def offset(index)
    date[index].to_i
  end

end
