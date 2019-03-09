class Room
  attr_accessor :room_name, :guests, :songs, :capacity

  def initialize(room_name, guests, songs, capacity)
    @room_name = room_name
    @guests = guests
    @songs = songs
    @capacity = capacity
  end

  def check_in(guest)
    if @guests.count < @capacity
      @guests << guest
      return "#{guest.name} - checked in :D "
    end
  end

  def check_out(guest)
    @guests.delete(guest)
    return "#{guest.name} - checked out :'( "
  end

  def add_songs_to_room(song)
   @songs << song
   return song.name
  end

  def favourite_song(guest, song)
    @songs.each {|song| return guest.jam if song == guest.fav_song}
    return nil
  end
end
