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

ActiveRecord::Schema.define(version: 20150429184106) do

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
    t.string   "training_location"
    t.text     "client_space_descrip"
    t.text     "independent_facility_descrip"
    t.text     "membership_facility_descrip"
    t.text     "private_facility_descrip"
    t.text     "credentials"
    t.text     "goals",                        default: [],              array: true
    t.text     "goal_specifics"
    t.text     "medical_conditions",           default: [],              array: true
    t.text     "orthopedic_injury_experience", default: [],              array: true
    t.text     "population_experience",        default: [],              array: true
    t.text     "athlete_experience"
    t.text     "training_style",               default: [],              array: true
    t.text     "appointment_lengths",          default: [],              array: true
    t.text     "group_training",               default: [],              array: true
    t.boolean  "consent_waiver"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
  end

  create_table "member_profiles", force: :cascade do |t|
    t.string   "ethnicity"
    t.string   "height"
    t.string   "weight"
    t.string   "smoking_status"
    t.string   "activity_level"
    t.text     "training_location",    default: [],              array: true
    t.text     "my_own_space"
    t.text     "independent_facility"
    t.text     "trainer_facility"
    t.text     "fitness_facility"
    t.text     "goals",                default: [],              array: true
    t.text     "goal_specifics"
    t.text     "medical_conditions",   default: [],              array: true
    t.text     "past_injury",          default: [],              array: true
    t.text     "injury_history",       default: [],              array: true
    t.text     "training_style",       default: [],              array: true
    t.string   "appointment_lengths",  default: [],              array: true
    t.string   "group_training",       default: [],              array: true
    t.boolean  "consent_waiver"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  create_table "user_types", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
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
end
