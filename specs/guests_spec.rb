require('minitest/autorun')
require('minitest/rg')
require_relative('../guests.rb')
require_relative('../songs.rb')
require_relative('../rooms.rb')


class GuestsTest < MiniTest::Test

  def setup
    @song1 = Songs.new("Wuthering Heights")
    @guest_a = Guests.new("Kathleen", 6, @song1)
    @guest_b = Guests.new("Dorothy", 3, @song1)

    @occupants = [@guest1]

    @room_a = Rooms.new("Room A", 8, @occupants, 0, 5)
  end

  def test_guests_class()
    assert_equal(Guests, @guest_a.class)
  end

  def test_guests_name()
    assert_equal("Kathleen", @guest_a.name)
  end

  def test_guests_cash()
    assert_equal(6, @guest_a.cash)
  end

  def test_guests_song()
    assert_equal(@song1, @guest_a.song)
  end

  def test_sufficient_funds__enough()
    assert_equal(true, @guest_a.sufficient_funds(@room_a.entry_fee))
  end

  def test_sufficient_funds__not_enough()
    assert_equal(false, @guest_b.sufficient_funds(@room_a.entry_fee))
  end

  def test_pay_entry_fee()
    @guest_a.pay_entry_fee(@room_a.entry_fee)
    assert_equal(1, @guest1.cash)
  end


end
