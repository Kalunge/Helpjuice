# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Search.destroy_all

# Search.create(query: 'Ruby on Rails', ip_address: '192.168.0.1')
# Search.create(query: 'what is a good car', ip_address: '127.0.0.3')
# Search.create(query: 'what is a good car hello', ip_address: '127.0.0.1')
# Search.create(query: 'what is a good car hello here', ip_address: '127.0.0.4')

puts 'Seed data created successfully.'
