require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'
require_relative './exercise_5'
require_relative './exercise_6'

puts "Exercise 7"
puts "----------"

class Employees < ActiveRecord::Base
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :hourly_rate, length: {maximum: 70, minimium: 40}
  validates :hourly_rate, numericality: { only_integer: true }
  validates :store_id, presence: true
end

class Store < ActiveRecord::Base
  validates :name, length: { minimum: 3 }
  validates :annual_revenue, numericality: {greater_than_or_equal: 0}
end

puts "Enter store name:"
storeName = gets.chomp

store = Store.create(name: storeName, annual_revenue: nil, mens_apparel: nil, womens_apparel: nil)
store.valid?
puts store.errors.full_messages