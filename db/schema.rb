# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150429184013) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string   "line1"
    t.string   "line2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "addresses", ["user_id"], name: "index_addresses_on_user_id", using: :btree

  create_table "fitness_professional_profiles", force: :cascade do |t|
    t.string   "ethnicity"
    t.text     "training_location",                         array: true
    t.text     "client_space_descrip"
    t.text     "independent_facility_descrip"
    t.text     "membership_facility_descrip"
    t.text     "private_facility_descrip"
    t.text     "credentials"
    t.text     "goals",                                     array: true
    t.text     "goal_specifics"
    t.text     "medical_conditions",                        array: true
    t.text     "orthopedic_injury_experience",              array: true
    t.text     "population_experience",                     array: true
    t.text     "athlete_experience"
    t.text     "training_style",                            array: true
    t.text     "appointment_lengths",                       array: true
    t.text     "group_training",                            array: true
    t.boolean  "consent_waiver"
    t.integer  "user_id"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "fitness_professional_profiles", ["user_id"], name: "index_fitness_professional_profiles_on_user_id", using: :btree

  create_table "member_profiles", force: :cascade do |t|
    t.string   "ethnicity"
    t.string   "height"
    t.string   "weight"
    t.string   "smoking_status"
    t.string   "activity_level"
    t.text     "training_location",                         array: true
    t.text     "own_space_descrip"
    t.text     "independent_facility_descrip"
    t.text     "trainer_facility_descrip"
    t.text     "fitness_facility_descrip"
    t.text     "goals",                                     array: true
    t.text     "goal_specifics"
    t.text     "medical_conditions",                        array: true
    t.text     "past_injury",                               array: true
    t.text     "injury_history",                            array: true
    t.text     "training_style",                            array: true
    t.text     "appointment_lengths",                       array: true
    t.text     "group_training",                            array: true
    t.boolean  "consent_waiver"
    t.integer  "user_id"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "member_profiles", ["user_id"], name: "index_member_profiles_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "user_type"
    t.string   "first_name",      null: false
    t.string   "last_name",       null: false
    t.string   "email",           null: false
    t.string   "phone",           null: false
    t.date     "birth_date",      null: false
    t.string   "gender",          null: false
    t.string   "photo_url"
    t.string   "password_digest"
    t.integer  "address_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "addresses", "users"
  add_foreign_key "fitness_professional_profiles", "users"
  add_foreign_key "member_profiles", "users"
end
