require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'

puts "Exercise 4"
puts "----------"

# Your code goes here ...
store4 = Store.create(name: "Surrey", annual_revenue: 224000, mens_apparel: false, womens_apparel: true)
store4.save
store5 = Store.create(name: "Whistler", annual_revenue: 1900000, mens_apparel: true, womens_apparel: false)
store5.save
store6 = Store.create(name: "Yaletown", annual_revenue: 430000, mens_apparel: true, womens_apparel: true)
store6.save

@mens_apparel = Store.where(mens_apparel: true)

@mens_apparel.each do |s|
  puts "#{s.name} annual income is #{s.annual_revenue}"
end

@womens_apparel = Store.where("annual_revenue < ? AND womens_apparel = ?", 1000000, true)

@womens_apparel.each do |s|
  puts s.name
end