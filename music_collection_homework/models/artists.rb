require('pg')

class Artists
  attr_reader :id
  attr_accessor :name

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  #CREATE

  def save()
    sql = "INSERT INTO artists (name) VALUES ($1) RETURNING id"
    values = [@name]
    artists = SqlRunner.run(sql, values)
    @id = artists_hashes[0]["id"].to_i
  end

  #READ

  def self.all()
    sql = "SELECT * FROM artists"
    artists_hashes = SqlRunner.run(sql)
    return artists_hashes.map { |artists_hashes| Album.new(artists_hashes) }
  end


end
