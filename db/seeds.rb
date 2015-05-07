# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

ethnicities = [
  "White / Caucasian",
  "African American",
  "Latin American",
  "Asian / Pacific Island Descent",
  "Native American",
  "Other"
]

training_locals_fp = [
"will go to client space",
"train at independent facility",
"train at fitness facility that requires membership",
"private facility"
]

training_locals_c = [
"own training equipment and space",
"train at home, but no equipment",
"independent facility",
"trainer's facility",
"fitness facility requires membership, but allows outside trainers"
]

goals = [
"improve chronic conditions",
"get lean / fat loss",
"gain lean mass / muscle",
"train for event",
"train for sport",
"train for specific fitness component"
]

medical_conditions = [
"disease risk factors",
"cardiovascular disease",
"pulminary disease",
"metabolic disease",
"neuromuscular disease",
"musculoskeletal condtions",
"immune-compromised condition",
"prefer not to disclose"
]

appointment_lengths = [
"30",
"60",
"90"
]

group_training = [
"1-1",
"2-4",
"5-10",
"10+"
]

training_styles = [
"motivator",
"coach",
"olympian",
"drill sargeant",
"analyzer"
]

past_injuries = [
"upper body",
"lower back / torso",
"lower body"
]

injury_historys_c = [
"head or neck",
"chest",
"shoulder",
"elbow",
"wrist or hand",
"upper back",
"lower back",
"torso or groin",
"hip",
"knee",
"foot or ankle"
]

population_experiences = [
"<14",
"14-17",
"65+",
"BMI > 30",
"pregnancy",
"athletes"
]

smoking_statuses = [
"never smoked",
"quit over 6 months ago",
"currently smoke"
]

activity_levels = [
"sedentary",
"lightly active",
"moderately active",
"very active",
"extra active"
]


genders = ["male", "female"]

user_id = 1
address_id = 1
fitness_professional_profile_id = 1
member_profile_id = 1

# create fitness professional users with address
# create fitness professional profiles with random user inputs
10.times do
  user = User.create(user_type: "Fitness_Professional",first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.safe_email, phone: Faker::PhoneNumber.phone_number, birth_date: Faker::Date.between(80.years.ago, 18.years.ago), gender: genders.sample, photo_url: Faker::Avatar.image, password: "password", address_id: address_id, fitness_professional_profile_id: fitness_professional_profile_id)
  address = Address.create(line1: Faker::Address.street_address, city: Faker::Address.city, state: Faker::Address.state_abbr, zip: Faker::Address.zip, user_id: user_id)
  profile = FitnessProfessionalProfile.create(ethnicity: ethnicities.sample, training_location: training_locals_fp.sample(rand(1..4)), client_space_descrip: Faker::Lorem.sentence, independent_facility_descrip: Faker::Lorem.sentence, membership_facility_descrip: Faker::Lorem.sentence, private_facility_descrip: Faker::Lorem.sentence, credentials: Faker::Lorem.sentence, goals: goals.sample(rand(1..6)), goal_specifics: Faker::Lorem.sentence, medical_conditions: medical_conditions.sample(rand(1..8)), orthopedic_injury_experience: past_injuries.sample(rand(1..3)), population_experience: population_experiences.sample(rand(1..6)), athlete_experience: Faker::Lorem.sentence, training_style: training_styles.sample(rand(1..5)), appointment_lengths: appointment_lengths.sample(rand(1..3)), group_training: group_training.sample(rand(1..4)), consent_waiver: true, user_id: user_id)
  user_id += 1
  address_id += 1
  fitness_professional_profile_id +=1
end


# create client users with address
# create member profiles with random user inputs
20.times do
  user = User.create(user_type: "Client",first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.safe_email, phone: Faker::PhoneNumber.phone_number, birth_date: Faker::Date.between(80.years.ago, 18.years.ago), gender: genders.sample, photo_url: Faker::Avatar.image, password: "password", address_id: address_id, member_profile_id: member_profile_id)
  address = Address.create(line1: Faker::Address.street_address, city: Faker::Address.city, state: Faker::Address.state_abbr, zip: Faker::Address.zip, user_id: user_id)
  profile = MemberProfile.create(ethnicity: ethnicities.sample, height: rand(4..7).to_s + " ft " + rand(1..12).to_s + " in", weight: rand(100..300).to_s, smoking_status: smoking_statuses.sample, activity_level: activity_levels.sample, training_location: training_locals_c.sample(rand(1..5)), own_space_descrip: Faker::Lorem.sentence, independent_facility_descrip: Faker::Lorem.sentence, trainer_facility_descrip: Faker::Lorem.sentence, fitness_facility_descrip: Faker::Lorem.sentence, goals: goals.sample(rand(1..6)), goal_specifics: Faker::Lorem.sentence, medical_conditions: medical_conditions.sample(rand(1..8)), past_injury: past_injuries.sample(rand(1..3)), injury_history: injury_historys_c.sample(rand(1..11)), training_style: training_styles.sample(rand(1..5)), appointment_lengths: appointment_lengths.sample(rand(1..3)), group_training: group_training.sample(rand(1..4)), consent_waiver: true, user_id: user_id)
  user_id += 1
  address_id += 1
  member_profile_id +=1
end
