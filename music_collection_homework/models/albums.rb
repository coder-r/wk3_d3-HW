require('pg')
require_relative('../db/sql_runner.rb')

class Album

  attr_accessor :title, :genre, :artists_id
  attr_reader :id,

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @genre = options['genre']
    @artists_id = options['artists_id'].to_i()
  end

  #CREATE

  def save()
    sql = "INSERT INTO albums (title, genre, artists_id) VALUES ($1, $2, $3)
    RETURNING id"
    values = [@title, @genre, @artists_id]
    album_hashes = SqlRunner.run(sql, values)
    @id = album_hashes[0]["id"].to_i
  end


  #READ

  def self.all()
    sql = "SELECT * FROM albums"
    album_hashes = SqlRunner.run(sql)
    return album_hashes.map { |album_hashes| Album.new(album_hashes) }
  end


  # def update()
  #   sql = "
  #   UPDATE pizza_orders SET (
  #     topping,
  #     quantity
  #   ) =
  #   (
  #     $1,$2,$3
  #   )
  #   WHERE id = $4"
  #   values = [@topping, @quantity, @customer_id, @id]
  #   SqlRunner.run(sql, values)
  # end

  # def delete()
  #   sql = "DELETE FROM music_collection where id = $1"
  #   values = [@id]
  #   SqlRunner.run(sql, values)
  # end
  #
  # def self.find(id)
  #   sql = "SELECT * FROM pizza_orders WHERE id = $1"
  #   values = [id]
  #   results = SqlRunner.run(sql, values)
  #   order_hash = results.first
  #   order = PizzaOrder.new(order_hash)
  #   return order
  # end
  #
  # def self.delete_all()
  #
  #   sql = "DELETE FROM pizza_orders"
  #   SqlRunner.run(sql)
  #
  # end
  #
  #
  # def customer()
  #
  #   sql = "SELECT * FROM customers WHERE id = $1"
  #   values = [@customer_id]
  #   results = SqlRunner.run(sql, values)
  #   return Customer.new(results[0])
  #
  # end

end
