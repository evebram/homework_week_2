require('minitest/autorun')
require('minitest/rg')
require_relative('../guests.rb')
require_relative('../songs.rb')
require_relative('../rooms.rb')


class GuestsTest < MiniTest::Test

  def setup
    @song1 = Songs.new("Wuthering Heights")
    @guest1 = Guests.new("Kathleen", 6, @song1)
    @guest2 = Guests.new("Dorothy", 3, @song1)

    @occupants = [@guest1]

    @room_a = Rooms.new("Room A", 8, @occupants, 0, 5)
  end

  def test_guests_class()
    assert_equal(Guests, @guest1.class)
  end

  def test_guests_name()
    assert_equal("Kathleen", @guest1.name)
  end

  def test_guests_cash()
    assert_equal(6, @guest1.cash)
  end

  def test_guests_song()
    assert_equal(@song1, @guest1.song)
  end

  def test_sufficient_funds__enough()
    assert_equal(true, @guest1.sufficient_funds(@room_a.entry_fee))
  end

  def test_sufficient_funds__not_enough()
    assert_equal(false, @guest2.sufficient_funds(@room_a.entry_fee))
  end

  def test_pay_entry_fee()
    @guest1.pay_entry_fee(@room_a.entry_fee)
    assert_equal(1, @guest1.cash)
  end


end
