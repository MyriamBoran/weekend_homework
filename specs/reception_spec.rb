require('minitest/autorun')
require('minitest/rg')
require_relative('../reception')
require_relative('../rooms')
require_relative('../guests')

class TillTest < MiniTest::Test

  def setup

    @guest = Guest.new("Kyle", 50, @song)

    @drinks = {"Cider" => 4, "Vodka" => 3, "Wine" => 2}

    @room_tabs = {
      tab_room1: 0,
      tab_room2: 0,
      tab_room3: 0
    }

    @reception = Reception.new(@drinks, @room_tabs)

  end

  def test_add_to_room_tab
    @reception.add_to_room_tab(:tab_room1, "Cider")
    @reception.add_to_room_tab(:tab_room2, "Vodka")
    @reception.add_to_room_tab(:tab_room3, "Wine")

    expected = {
      tab_room1: 4,
      tab_room2: 3,
      tab_room3: 2
    }

    assert_equal(expected, @reception.room_tabs)
  end


end
