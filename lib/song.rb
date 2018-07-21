require_relative 'artist'

class Song

attr_accessor :name, :artist

  def initialize(name)
    @name = name
  end

  def self.new_by_filename(filename)
#modify filename to get artist_name and song_name
    modded_file = filename.split " - "
    artist_name = modded_file[0]
    song_name = modded_file[1]
#create new artist and song based on artist_name & song_name
    artist = Artist.find_or_create_by_name(artist_name)
    song = Song.new(song_name)
#relate artist instance to Song's instance and vice versa
    song.artist = artist
    artist.add_song(song)
#return song now with artist relationship
    song
  end

end
