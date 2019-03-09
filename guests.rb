class Guest
  attr_accessor :name, :wallet, :fav_song

  def initialize(name, wallet, fav_song)
    @name = name
    @wallet = wallet
    @fav_song = fav_song
  end

  def jam
    return "That's my jam right there!"
  end
end
