class CreateMemberProfiles < ActiveRecord::Migration
  def change
    create_table :member_profiles do |t|
      t.string :ethnicity
      t.string :height
      t.string :weight
      t.string :smoking_status
      t.string :activity_level
      t.text :training_location, array: true, default: []
      t.text :my_own_space
      t.text :independent_facility
      t.text :trainer_facility
      t.text :fitness_facility
      t.text :goals, array: true, default: []
      t.text :goal_specifics
      t.text :medical_conditions, array: true, default: []
      t.text :past_injury, array: true, default: []
      t.text :injury_history, array: true, default: []
      t.text :training_style, array: true, default: []
      t.string :appointment_lengths, array: true, default: []
      t.string :group_training, array: true, default: []
      t.boolean :consent_waiver
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :member_profiles, :users
  end
end
