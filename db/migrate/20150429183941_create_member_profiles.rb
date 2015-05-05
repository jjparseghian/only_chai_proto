class CreateMemberProfiles < ActiveRecord::Migration
  def change
    create_table :member_profiles do |t|
      t.string :ethnicity
      t.string :height
      t.string :weight
      t.string :smoking_status
      t.string :activity_level
      t.text :training_location, array: true
      t.text :own_space_descrip
      t.text :independent_facility_descrip
      t.text :trainer_facility_descrip
      t.text :fitness_facility_descrip
      t.text :goals, array: true
      t.text :goal_specifics
      t.text :medical_conditions, array: true
      t.text :past_injury, array: true
      t.text :injury_history, array: true
      t.text :training_style, array: true
      t.string :appointment_lengths, array: true
      t.string :group_training, array: true
      t.boolean :consent_waiver
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :member_profiles, :users
  end
end
