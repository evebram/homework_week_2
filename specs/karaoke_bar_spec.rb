require('minitest/autorun')
require('minitest/rg')
require_relative('../karaoke_bar.rb')

class KaraokeBarTest < MiniTest::Test

  def setup
    @karaoke_bar = KaraokeBar.new("CodeClan Caraoke")
  end

  def test_karaoke_class()
    assert_equal(KaraokeBar, @karaoke_bar.class())
  end

  def test_karaoke_name()
    assert_equal("CodeClan Caraoke", @karaoke_bar.name())
  end

end
