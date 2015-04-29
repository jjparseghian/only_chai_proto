class CreateFitnessProfessionalProfiles < ActiveRecord::Migration
  def change
    create_table :fitness_professional_profiles do |t|
      t.string :ethnicity
      t.string :training_location
      t.text  :client_space_descrip
      t.text :independent_facility_descrip
      t.text :membership_facility_descrip
      t.text :private_facility_descrip
      t.text :credentials
      t.text :goals, array: true, default: []
      t.text :goal_specifics
      t.text :medical_conditions, array: true, default: []
      t.text :orthopedic_injury_experience, array: true, default: []
      t.text :population_experience, array: true, default: []
      t.text :athlete_experience
      t.text :training_style, array: true, default: []
      t.text :appointment_lengths, array: true, default: []
      t.text :group_training, array: true, default: []
      t.boolean :consent_waiver

      t.timestamps null: false
    end
  end
end
