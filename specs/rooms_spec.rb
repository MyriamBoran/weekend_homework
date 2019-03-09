require('minitest/autorun')
require('minitest/rg')
require_relative('../rooms')
require_relative('../guests')
require_relative('../songs')
require_relative('../reception')


class RoomTest < MiniTest::Test

  def setup

    @i_want_it_all = Song.new("I want it all")
    @hello = Song.new("Hello")
    @shoop = Song.new("Shoop")

    @annie = Guest.new("Annie", 40, @shoop)
    @bill = Guest.new("Bill", 60, @i_want_it_all)
    @camilla = Guest.new("Camilla", 30, @hello)

    @room1 = Room.new("Room 1", [], [], 4)
    @room2 = Room.new("Room 2", [], [], 3)
    @room3 = Room.new("Room 3", [], [], 2)
  end

  def test_room_name
    assert_equal("Room 1", @room1.room_name)
  end

  def test_check_in
    assert_equal(@room1.guests, [])
    assert_equal("Annie - checked in :D ", @room1.check_in(@annie))
    assert_equal(@room1.guests, [@annie])
  end

  def test_check_out
    @room1.check_in(@annie)
    assert_equal(@room1.guests, [@annie])
    assert_equal("Annie - checked out :'( ", @room1.check_out(@annie))
    assert_equal(@room1.guests, [])
  end

  def test_add_songs_to_room
    assert_equal(@room1.songs, [])
    assert_equal("I want it all", @room1.add_songs_to_room(@i_want_it_all))
    assert_equal(@room1.songs, [@i_want_it_all])
  end

  def test_check_in_over_capacity
    @room3.check_in(@annie)
    @room3.check_in(@bill)
    assert_equal(@room3.guests.count, 2)
    @room3.check_in(@camilla)
    assert_equal(@room3.guests.count, 2)
  end

  def test_favourite_song
    assert_equal(@room3.songs, [])
    @room3.add_songs_to_room(@hello)
    expected = "That's my jam right there!"
    assert_equal(expected, @room3.favourite_song(@camilla, @hello))
  end
end
