# require 'faker'
# Hiringcheck.destroy_all
# User.destroy_all
Job.destroy_all
# Restaurant.destroy_all
Userjob.destroy_all

# puts "🌱 Seeding spices..."

# puts "🌱 Seeding hiring_manager_check..."
# Hiringcheck.create(manager?: true)
# Hiringcheck.create(manager?: false)

# puts "🌱 Seeding users..."
# # t.integer "hiringcheck_id_id"
# # t.string "full_name"
# # t.integer "phone_number"
# # t.text "email"
# # t.text "description"
# # t.text "profile_pic"
# # t.text "linkedin_link"
# User.create(hiringcheck_id:1, full_name:"Tye S.", phone_number: 5555555555, email: "TyesEmail@email.com", description: "I like long walks on the beach, and hiring for restaurants!")
# User.create(hiringcheck_id:1, full_name:"Chris K.", phone_number: 5555555551, email: "ChrissEmail@email.com", description: "I like long walks on the beach, and hiring for restaurants!")
# User.create(hiringcheck_id:1, full_name:"Shivang D.", phone_number: 5555555552, email: "ShivangsEmail@email.com", description: "I like long walks on the beach, and hiring for restaurants!")
# User.create(hiringcheck_id:1, full_name:"Dakota M.", phone_number: 5555555553, email: "DakotasEmail@email.com", description: "I like long walks on the beach, and hiring for restaurants!")

# 100.times do 
#     User.create(
#     hiringcheck_id:2, 
#     full_name:Faker::Name.name, 
#     phone_number: Faker::PhoneNumber.cell_phone, 
#     email: Faker::Internet.email, 
#     description: Faker::Quote.famous_last_words
#     )
# end

# puts "🌱 Seeding restaurants..."
# #borough_location is given an int value so we can match each one to a borough (i.e. 1 => Queens, 2 => Manhattan, etc.)
# #price_range is given an int value so we can match each one to a range (i.e. 1 => $, 2 => $$, etc.)

# 90.times do 
#     Restaurant.create(
#     user_id: rand(1..4),
#     name: Faker::Restaurant.name, 
#     restaurant_type: Faker::Restaurant.type,
#     borough_location: rand(1..5),
#     price_range: rand(1..4),
#     )
# end



puts "🌱 Seeding jobs..."
#name is given an int value so we can match each one to a job (i.e. 1 => Chef, 2 => Manager, etc.)

200.times do 
    Job.create(
    name: rand(1..5),
    restaurant_id:rand(1..90),
    job_type: Faker::Job.employment_type,
    pay: rand(15..30),
    description: Faker::Job.seniority,
    desired_start_date: Faker::Date.between(from: '2021-10-01', to: '2022-02-01'),
    # hiring_managerid: self.get_id
    )
end

puts "🌱 Seeding user_jobs..."

150.times do 
    Userjob.create(
    user_id:rand(4..100), 
    job_id:rand(1..200)
    )
end




# Seed your database here

puts "✅ Done seeding!"
