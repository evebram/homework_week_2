require('minitest/autorun')
require('minitest/rg')
require_relative('../guests.rb')
require_relative('../songs.rb')

class GuestsTest < MiniTest::Test

  def setup
    @song1 = Songs.new("Wuthering Heights")
    @guest = Guests.new("Kathleen", 5, @song1)
  end

  def test_guests_class()
    assert_equal(Guests, @guest.class)
  end

  def test_guests_name()
    assert_equal("Kathleen", @guest. name)
  end

  def test_guests_cash()
    assert_equal(5, @guest.cash)
  end

  def test_guests_song()
    assert_equal(@song1, @guest.song)
  end

end
