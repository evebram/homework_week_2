class Rooms

  attr_reader :name, :capacity, :till, :entry_fee

  def initialize(name, capacity, occupants, till, entry_fee)
    @name = name
    @capacity = capacity
    @occupants = occupants
    @till = till
    @entry_fee = entry_fee
    @playlist = []
  end

  def count_guests()
    return @occupants.size
  end

  def check_into_room(guest)
    @occupants << guest
  end

  def check_multiple_guests_into_room(guests)
    @occupants += guests
  #  return @occupants
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

  def check_for_space_in_room(guest, capacity)
      if @occupants.count <= capacity
        @occupants << guest
      end
    end

 def check_for_one_space_in_room(guest, capacity)
   # for space in @occupants
   #   if space < capacity
     if @occupants.count < capacity
       check_into_room(guest)
       return true
     else
       return false
   end
  end

  def space_for_multiple_guests(guests, capacity)
    space = capacity - @occupants.count
     if space >= capacity
       check_multiple_guests_into_room(guests)
       return true
       #return @occupants.count
     else
       return false
     end
  end

  def guest_pay_entry_fee(guest, entry_fee)
    if check_for_one_space_in_room(@guest1, @capacity) == true
      guest.pay_entry_fee(entry_fee)
      @till += entry_fee
      check_into_room(@guest1)
    end
  end

  def thats_my_jam(fave_song, song)
    add_song_to_playlist(song)
    if @playlist.find { |songs| songs == fave_song}
      return "That's my JAM!"
    else
      return false
    end
  end

end
