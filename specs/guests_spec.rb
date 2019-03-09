require('minitest/autorun')
require('minitest/rg')
require_relative('../guests')
require_relative('../songs')
require_relative('../rooms')

class GuestTest < MiniTest::Test

  def setup
    @guest = Guest.new("Kyle", 50, @song)
    @rooms = Room.new("Room 1", [], [], 3, 4)
  end

  def test_has_name_has_wallet
    assert_equal("Kyle", @guest.name)
    assert_equal(50, @guest.wallet)
  end

  def test_jam
    assert_equal("That's my jam right there!", @guest.jam)
  end

  # def tets_buy_ticket
  #   @guest.buy_ticket(@entry_fee)
  #   assert_equal(47, @guest.wallet)
  # end
end
