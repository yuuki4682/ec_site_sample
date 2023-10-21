# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
  email: 'admin@admin',
  password: '111111'
  )
  
Customer.create!(
  name: '田中太郎',
  email: 'test@test',
  password: '111111'
  )
Customer.create!(
  name: '佐藤次郎',
  email: 'test2@test',
  password: '111111'
  )
Customer.create!(
  name: '鈴木三郎',
  email: 'test3@test',
  password: '111111'
  )