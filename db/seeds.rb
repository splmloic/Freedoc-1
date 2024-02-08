# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Supprimer toutes les données existantes
Doctor.destroy_all
Specialty.destroy_all
City.destroy_all

# Créer des villes fictives
city1 = City.create(name: 'Toulouse')
city2 = City.create(name: 'Albi')

# Créer des spécialités fictives
specialty1 = Specialty.create(name: 'Généraliste')
specialty2 = Specialty.create(name: 'Chirurgien')

# Créer des docteurs avec des associations aléatoires de spécialités et de villes
10.times do
  doctor = Doctor.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    zip_code: Faker::Address.zip_code,
    city: [city1, city2].sample,
    specialties: [specialty1, specialty2].sample(rand(1..2))
  )
end

#Créer les Patients 
10.times do
    patient = Patient.create(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      city: [city1, city2].sample
    )
end

# Créer des rendez-vous fictifs entre docteurs et patients
20.times do
    doctor = Doctor.all.sample
    patient = Patient.all.sample
    appointment = Appointment.create(
      date: Faker::Time.between(from: DateTime.now, to: DateTime.now + 30),
      doctor: doctor,
      patient: patient,
      city: [city1, city2].sample
    )
end