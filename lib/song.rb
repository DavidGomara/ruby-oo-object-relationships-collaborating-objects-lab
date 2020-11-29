class Song
    
    attr_accessor :name, :artist
    
    @@all = []
    
    def initialize(name)
        @@all << self 
        @name = name
    end 
    
    def self.all
        @@all
    end 
    
    def self.new_by_filename(filename)
        array = filename.split("-").collect { |element| element.strip}
        artist = array[0]
        song_name = array[1]
        song = Song.new(song_name)
        song.artist_name = artist
        song
    end 
    
    def artist_name=(name)
       self.artist = Artist.find_or_create_by_name(name)
       artist.add_song(self)
    end 
    
end 