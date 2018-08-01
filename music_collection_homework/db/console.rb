require("pry")
require_relative("../models/albums")
require_relative("../models/artists")

# PizzaOrder.delete_all
# Customer.delete_all

#
artist1 = Artists.new({'name' => "Drake"})
artist1.save

artist2 = Artists.new({'name' => "JCole"})
artist2.save

album1 = Album.new({'title' => "In My Feelings", 'genre' => "RnB",'artists_id' => artists1.id()})
album1.save

album2 = Album.new({'title' => "Role Models", 'genre' => "Soul",'artists_id' => artists2.id()})
album2.save

binding.pry

nil
