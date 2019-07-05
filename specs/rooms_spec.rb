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

    @room = Rooms.new("Room 1", 4, @occupants)

  end

  def test_room_class()
    assert_equal(Rooms, @room.class)
  end

  def test_room_name()
    assert_equal("Room 1", @room.name)
  end

  def test_room_capacity()
    assert_equal(4, @room.capacity)
  end

  def test_room_occupants()
    assert_equal(3, @room.count_guests())
  end

  def test_check_into_room()
    @guest4 = Guests.new("Kenny", 2, @song2)
    @room.check_into_room(@guest4)
    assert_equal(4, @room.count_guests())
  end

  def test_check_out_of_room()
    @room.check_out_of_room(@guest1)
    assert_equal(2, @room.count_guests())
  end

  def test_add_song_to_playlist()
    @room.add_song_to_playlist(@song3)
    assert_equal(1, @room.check_playlist())
  end

  def test_can_guest_enter_room__true()
    @room.check_for_space_in_room(@guest1, @room.capacity)
    assert_equal(true, )
  end

  # def test_thats_my_jam()
  #
  # end

end
