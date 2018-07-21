require_relative 'artist'

class Artist

attr_accessor :name, :songs

@@all = []

  def initialize(name)
    @name = name
    @songs = []
    self.class.all << self
  end

  def self.all
    @@all
  end

  def add_song(song_name)
    @songs << song_name
  end

  def save
    self.class.all << self
  end

  def self.find_or_create_by_name(name)
  #set var search to result of finding if artist argument exists in Artist class
    search = Artist.all.find {|element| element.name == name}
  #based on result of search, create new artist or return results of search
    search == nil ? Artist.new(name) : search
  end

  def print_songs
    @songs.each {|element| puts element.name}
  end

end
