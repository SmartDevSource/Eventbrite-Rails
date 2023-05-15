User.destroy_all
Event.destroy_all
Attendance.destroy_all

def generate_random_multiple_of_5(min_value, max_value)
  range_size = (max_value - min_value) / 5 + 1
  random_number = rand(range_size).to_i * 5 + min_value
  random_number
end

# Création des utilisateurs
3.times do
  User.create(
    email: Faker::Internet.email(domain: "yopmail.com"),
    encrypted_password: Faker::Internet.password,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    description: Faker::Lorem.paragraph
  )
end

puts 'Utilisateurs créés avec succès.'

# Création des événements
3.times do
  Event.create(
    start_date: Faker::Time.between_dates(from: Date.today, to: Date.today + 30),
    title: Faker::Lorem.sentence,
    location: Faker::Address.full_address,
    description: Faker::Lorem.paragraph,
    price: Faker::Number.between(from: 1, to: 1000),
    duration: generate_random_multiple_of_5(5, 120)
  )
end

puts 'Événements créés avec succès.'

# Création des participations
3.times do
  Attendance.create(stripe_customer_id: Faker::Alphanumeric.alphanumeric(number: 10))
end

puts 'Participations créées avec succès.'