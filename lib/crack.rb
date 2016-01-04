$LOAD_PATH.unshift(__dir__)


class Crack
  attr_reader :secret_text, :decryptor

  LAST_WORDS = " the end"

  def initialize(secret_text, decryptor)
    @secret_text = secret_text
    @decryptor = decryptor
  end

  def key_finder
    decryptor.string = secret_text[-8..-1]
    key_iterater(decryptor)
  end

  def key_iterater(cryptic = decryptor, key = "00000")
    cryptic.key = key
    if cryptic.decrypt == LAST_WORDS
      return key
    else
      key_iterater(cryptic, key_counter(key))
    end
  end

  def key_counter(current_key)
    new_key = (current_key.to_i + 1).to_s
    new_key + "0" * (5 - new_key.length)
  end

  def code_breaker
    decryptor.key = key_finder
    decryptor.string = secret_text
    decryptor.decrypt
  end

end
