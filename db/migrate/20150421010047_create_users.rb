class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.boolean :fitness_professional, null: false
      t.string :email, null: false
      t.string :phone, null: false
      t.date  :birth_date, null: false
      t.string :gender, null: false
      t.string :photo_url
      t.string :ethnicity
      t.string :height
      t.string :weight
      t.string :smoking_status
      t.string :activity_level
      t.string :training_location
      t.text :my_own_space
      t.text :independent_facility
      t.text :trainer_facility
      t.text :fitness_facility
      t.text :goals, null: false
      t.text :goal_specifics
      t.text :medical_conditions
      t.text :past_injury_location
      t.text :injury_history
      t.string :training_style
      t.string :appointment_lengths, null: false
      t.string :group_training, null: false
      t.boolean :consent_waiver, default: false
      t.string :password_digest
      t.references :address

      t.timestamps null: false
    end
  end
end
