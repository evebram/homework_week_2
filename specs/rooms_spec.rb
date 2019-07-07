require('minitest/autorun')
require('minitest/rg')
require_relative('../guests.rb')
require_relative('../rooms.rb')
require_relative('../songs.rb')

class RoomsTest < MiniTest::Test

  def setup

    @song1 = Songs.new("Stay With Me")
    @song2 = Songs.new("Toxic")
    @song3 = Songs.new("Lose Yourself")

    @guest1 = Guests.new("Jessica", 9, @song1)
    @guest2 = Guests.new("Susan", 3, @song2)
    @guest3 = Guests.new("Frida", 5, @song1)
    @guest4 = Guests.new("Sarah", 12, @song1)
    @guest5 = Guests.new("Damien", 1, @song2)
    @guest6 = Guests.new("Jason", 6, @song1)

    @occupants = [@guest1, @guest2, @guest3]
    @new_arrivals = [@guest4, @guest5, @guest6]

    @room1 = Rooms.new("Room 1", 8, @occupants, 0, 5)
    @room2 = Rooms.new("Room 2", 3, @occupants, 0, 2)
    @room3 = Rooms.new("Room 3", 5, @occupants, 0, 3)

  end

  def test_room1_class()
    assert_equal(Rooms, @room1.class)
  end

  def test_room1_name()
    assert_equal("Room 1", @room1.name)
  end

  def test_room1_capacity()
    assert_equal(8, @room1.capacity)
  end

  def test_room1_occupants()
    assert_equal(3, @room1.count_guests())
  end

  def test_till_total()
    assert_equal(0, @room1.till)
  end

  def test_room_entry_fee()
    assert_equal(5, @room1.entry_fee)
  end

  def test_check_into_room1()
    @guest4 = Guests.new("Kenny", 2, @song2)
    @room1.check_into_room(@guest4)
    assert_equal(4, @room1.count_guests())
  end

  def test_check_multiple_guests_into_room()
    @room1.check_multiple_guests_into_room(@new_arrivals)
    assert_equal(6, @room1.count_guests())
  end

  def test_check_out_of_room1()
    @room1.check_out_of_room(@guest1)
    assert_equal(2, @room1.count_guests())
  end

  def test_add_song_to_playlist()
    @room1.add_song_to_playlist(@song3)
    assert_equal(1, @room1.check_playlist())
  end

  def test_can_one_guest_enter_room__yes()
    @room1.check_for_one_space_in_room(@guest4, @room1.capacity)
    assert_equal(4, @room1.count_guests())
  end

  def test_can_one_guest_enter_room__no()
    #@room2.check_for_space_in_room(@guest1, @room2.capacity)
    assert_equal(false, @room2.check_for_one_space_in_room(@guest4, @room2.capacity))
  end

  def test_add_mulitple_guests__yes()
    #@room1.space_for_multiple_guests(@new_arrivals, @room1.capacity)
    assert_equal(6, @room1.space_for_multiple_guests(@new_arrivals, @room1.capacity))
  end

  def test_add_mulitple_guests__no()
    assert_equal(false, @room3.space_for_multiple_guests(@new_arrivals, @room3.capacity))
  end

  def test_guest_pay_entry_fee()
    @room3.guest_pay_entry_fee(@guest1, @room3.entry_fee)
    assert_equal(6, @guest1.cash)
    assert_equal(3, @room3.till)
    assert_equal(4, @room3.count_guests())
  end

  def test_thats_my_jam()
    assert_equal("That's my JAM!", @room1.thats_my_jam(@guest1.song, @song1))
  end

  def test_thats_not_my_jam()
    assert_equal(false, @room1.thats_my_jam(@guest2.song, @song1))
  end

end
