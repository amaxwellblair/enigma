module KeyGenerator

  def self.generate_key(num)
    num.times.map do |i|
      rand(9).to_s
    end.join
  end

end
