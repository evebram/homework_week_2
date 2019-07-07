require('minitest/autorun')
require('minitest/rg')
require_relative('../rooms.rb')
require_relative('../guests.rb')
require_relative('../songs.rb')

class RoomsTest < MiniTest::Test

  def setup

    @song1 = Songs.new("Stay With Me")
    @song2 = Songs.new("Toxic")
    @song3 = Songs.new("Lose Yourself")

    @guest1 = Guests.new("Jessica", 9, @song1)
    @guest2 = Guests.new("Susan", 3, @song2)
    @guest3 = Guests.new("Frida", 5, @song1)

    @occupants = [@guest1, @guest2, @guest3]

    @room1 = Rooms.new("Room 1", 6, @occupants)
    @room2 = Rooms.new("Room 2", 3, @occupants)

  end

  def test_room1_class()
    assert_equal(Rooms, @room1.class)
  end

  def test_room1_name()
    assert_equal("Room 1", @room1.name)
  end

  def test_room1_capacity()
    assert_equal(6, @room1.capacity)
  end

  def test_room1_occupants()
    assert_equal(3, @room1.count_guests())
  end

  def test_check_into_room1()
    @guest4 = Guests.new("Kenny", 2, @song2)
    @room1.check_into_room(@guest4)
    assert_equal(4, @room1.count_guests())
  end

  def test_check_out_of_room1()
    @room1.check_out_of_room(@guest1)
    assert_equal(2, @room1.count_guests())
  end

  def test_add_song_to_playlist()
    @room1.add_song_to_playlist(@song3)
    assert_equal(1, @room1.check_playlist())
  end

  def test_can_guest_enter_room__yes()
    @room1.check_for_space_in_room(@guest1, @room1.capacity)
    assert_equal(4, @room1.count_guests())
  end

  def test_can_guest_enter_room__no()
    #@room2.check_for_space_in_room(@guest1, @room2.capacity)
    assert_equal(false, @room2.check_for_space_in_room(@guest1, @room2.capacity))
  end

  # def test_thats_my_jam()
  #
  # end

end
