# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create!(name: "seif_admin", email: "seif_admin@swiftx.com", password: "seif123456", password_confirmation: "seif123456", role: "admin")
User.create!(name: "seif_manager", email: "seif_manager@swiftx.com", password: "seif123456", password_confirmation: "seif123456", role: "user_manager")
User.create!(name: "seif_user", email: "seif_user@swiftx.com", password: "seif123456", password_confirmation: "seif123456", role: "normal_user")

JoggingTime.create!(date: Date.today, distance: 10, time: DateTime.now, user_id: 1)
JoggingTime.create!(date: Date.today, distance: 20, time: DateTime.now, user_id: 2)
JoggingTime.create!(date: Date.today, distance: 30, time: DateTime.now, user_id: 3)