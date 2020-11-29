class Artist
    
    attr_accessor :name 
    
    @@all = []
    
    def initialize(name)
    @@all << self
    @name = name
    end 
    
    def self.all
        @@all
    end 
    
    def songs
        Song.all.select{|song| song if song.artist == self}
    end 
    
    def add_song(song)
        song.artist = self
    end 
    
    def self.find_or_create_by_name(name)
        self.all.find {|artists| artists.name == name } ? self.all.find {|artists| artists.name == name } : self.new(name)
    end 
    
    def print_songs
        Song.all.collect{|song| print song.name + "\n" if song.artist == self}
    end 
    
end 