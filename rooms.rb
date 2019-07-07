class Rooms

  attr_reader :name, :capacity

  def initialize(name, capacity, occupants)
    @name = name
    @capacity = capacity
    @occupants = occupants
    @playlist = []
  end

  def count_guests()
    return @occupants.size
  end

  def check_into_room(guest)
    @occupants << guest
  end

  def check_out_of_room(guest)
    return @occupants.delete(guest)
  end

  def check_playlist()
    return @playlist.size
  end

  def add_song_to_playlist(song)
    @playlist << song
  end

  # def check_for_space_in_room(guest, capacity)
  #     if @occupants.count <= capacity
  #       @occupants << guest
  #     end
  #   end

 def check_for_space_in_room(guest, capacity)
   # for space in @occupants
   #   if space < capacity
     if @occupants.count < capacity
       check_into_room(guest)
     else
       return false
   end
  end



end
