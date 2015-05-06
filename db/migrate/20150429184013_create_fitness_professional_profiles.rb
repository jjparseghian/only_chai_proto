class CreateFitnessProfessionalProfiles < ActiveRecord::Migration
  def change
    create_table :fitness_professional_profiles do |t|
      t.string :ethnicity
      t.text :training_location, array: true
      t.text  :client_space_descrip
      t.text :independent_facility_descrip
      t.text :membership_facility_descrip
      t.text :private_facility_descrip
      t.text :credentials
      t.text :goals, array: true
      t.text :goal_specifics
      t.text :medical_conditions, array: true
      t.text :orthopedic_injury_experience, array: true
      t.text :population_experience, array: true
      t.text :athlete_experience
      t.text :training_style, array: true
      t.text :appointment_lengths, array: true
      t.text :group_training, array: true
      t.boolean :consent_waiver
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :fitness_professional_profiles, :users
  end
end
