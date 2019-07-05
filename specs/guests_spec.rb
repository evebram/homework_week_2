require('minitest/autorun')
require('minitest/rg')
require_relative('../guests.rb')

class GuestsTest < MiniTest::Test

  def setup
    @guest = Guests.new("Kathleen", 5, "Wuthering Heights")
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
    assert_equal("Wuthering Heights", @guest.song)
  end

end
