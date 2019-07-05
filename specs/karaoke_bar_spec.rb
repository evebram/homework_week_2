require('minitest/autorun')
require('minitest/rg')
require_relative('../karaoke_bar.rb')
require_relative('../rooms.rb')
require_relative('../guests.rb')
require_relative('../songs.rb')

class KaraokeBarTest < MiniTest::Test

  def setup
    @karaoke_bar = KaraokeBar.new("CodeClan Caraoke")

    @room1 = Rooms.new("Room 1", 6)
    @room2 = Rooms.new("Room 2", 4)

    @rooms = [@room1, @room2]

    @song1 = Songs.new("Stay With Me")
    @song2 = Songs.new("Toxic")

    @guest1 = Guests.new("Jessica", 9, @song1)

    @playlist = [@song1, @song2]
  end

  def test_karaoke_class()
    assert_equal(KaraokeBar, @karaoke_bar.class())
  end

  def test_karaoke_name()
    assert_equal("CodeClan Caraoke", @karaoke_bar.name())
  end

end
