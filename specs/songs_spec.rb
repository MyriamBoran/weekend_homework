require('minitest/autorun')
require('minitest/rg')
require_relative('../songs')
require_relative('../guests')

class SongTest < MiniTest::Test

  def setup
    @song = Song.new("You are so perfect tonight")
  end

  def test_has_name
    assert_equal("You are so perfect tonight", @song.name)
  end
end
