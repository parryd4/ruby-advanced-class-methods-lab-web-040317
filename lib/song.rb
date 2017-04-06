require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    temp = Song.new
    temp.save
    temp
  end

  def self.new_by_name(name)
    temp = Song.new
    temp.name = name
    temp
  end

  def self.create_by_name(name)
    temp = Song.new_by_name(name)
    temp.save
    temp
  end

  def self.find_by_name(name)
    @@all.each {|song| return song if song.name == name}
  end

  def self.find_or_create_by_name(name)
    return Song.find_by_name(name) unless Song.find_by_name(name).class == Array
    Song.create_by_name(name)
  end

  def self.alphabetical
    @@all.sort_by {|obj| obj.name}
  end

  def self.new_from_filename(filename)
    temp = Song.new
    data = filename.chomp(".mp3").split(' - ')
    temp.artist_name = data.first
    temp.name = data.last
    temp
  end

  def self.create_from_filename(filename)
    temp = Song.new_from_filename(filename).save
    temp
  end

  def self.destroy_all
    @@all = []
  end
end

#binding.pry
puts ""
