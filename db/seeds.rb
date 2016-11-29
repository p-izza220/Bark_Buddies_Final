# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

owners = Owner.create([{username: "p_izza", password_digest: "12345", contact: "555 555 5555", dog_name: "Watson", profile_pic: "N/A"}, { username: "Hammy" , password_digest: "12345" , contact: "555 555 5555", dog_name: "Bowie", profile_pic: "N/A"}, { username: "Royce", password_digest: "12345" , contact: "555 555 5555", dog_name: "Peanut", profile_pic: "N/A"}, { username: "Eliza", password_digest: "12345", contact: "555 555 5555", dog_name: "Hazel", profile_pic: "N/A"}])