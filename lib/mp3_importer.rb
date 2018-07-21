require_relative 'song'

class MP3Importer

attr_accessor :path, :size

@@files = []

  def initialize(path)
    @path = path
  end

  def self.all
    @@files
  end

  def files
  #search and return an array of filenames from instances path
    Dir[@path + '/*.mp3'].map {|element| File.basename(element) }
  end

  def import
  #iterate through array of filenames from instance and create new Song instance for each
    songs = self.files
    songs.each {|element| Song.new_by_filename(element) }
  end

end
