require('minitest/autorun')
require('minitest/rg')
require_relative('../rooms.rb')

class RoomsTest < MiniTest::Test

  def setup
    @room = Rooms.new("Room 1", 8)
  end

  def test_room_class()
    assert_equal(Rooms, @room.class)
  end

  def test_room_name()
    assert_equal("Room 1", @room.name)
  end

  def test_room_capacity()
    assert_equal(8, @room.capacity )
  end

end
