require_relative '../config/environment.rb'

# create your variables and/or write any tests here
ray = Tourist.new("Ray")
fel = Tourist.new("Fel")
james = Tourist.new("james")

monas = Landmark.new("Monas", "Jakarta")
kebun_raya = Landmark.new("Kebun Raya", "Bogor")
rinjani = Landmark.new("Gunung Rinjani", "Lombok")
kerinci = Landmark.new("Gunung Kerinci", "Kerinci")

puts "-----Tourist Class Test-----"
puts ray.name == "Ray"
puts Tourist.all == [ray, fel, james]
puts Tourist.find_by_name("james") == james
ray.visit_landmark(rinjani) 
ray.visit_landmark(kerinci) 
puts ray.trips[0].landmark == rinjani
puts ray.trips[1].landmark == kerinci
puts ray.landmarks == [rinjani, kerinci]
puts ray.never_visited == [monas, kebun_raya]
puts "-----Tourist Class Test-----"

puts ""

puts "-----Landmark Class  Test-----"
puts Landmark.all == [monas, kebun_raya, rinjani, kerinci]
puts Landmark.find_by_city("Jakarta") == [monas]
puts kerinci.trips[0].tourist == ray
puts kerinci.tourists == [ray]
puts "-----Landmark Class Test-----"

puts ""

puts "-----Trip Class Test-----"
puts Trip.all[0].tourist == ray && Trip.all[0].landmark == rinjani
puts Trip.all[0].tourist == ray
puts Trip.all[0].landmark == rinjani
puts "-----Trip Class Test-----"
