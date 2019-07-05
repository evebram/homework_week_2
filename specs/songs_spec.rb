require('minitest/autorun')
require('minitest/rg')
require_relative('../songs.rb')

class SongsTest < MiniTest::Test

  def setup
    @song = Songs.new("Alone", "Heart")
  end

  def test_songs_class()
    assert_equal(Songs, @song.class)
  end

  def test_song_title()
    assert_equal("Alone", @song.title)
  end

  def test_song_artist()
    assert_equal("Heart", @song.artist)
  end

end
