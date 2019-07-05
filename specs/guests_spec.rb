require('minitest/autorun')
require('minitest/rg')
require_relative('../guests.rb')

class GuestsTest < MiniTest::Test

  def setup
    @guests = Guests.new("Kathleen", 5, "Wuthering Heights")
  end

  def test_guests_class()
    assert_equal(Guests, @guests.class)
  end

  def test_guests_name()
    assert_equal("Kathleen", @guests. name)
  end

  def test_guests_cash()
    assert_equal(5, @guests.cash)
  end

  def test_guests_song()
    assert_equal("Wuthering Heights", @guests.song)
  end

end
