class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :email, null: false
      t.string :phone, null: false
      t.date  :birth_date, null: false
      t.string :gender, null: false
      t.string :photo_url
      t.string :password_digest
      t.references :address

      t.timestamps null: false
    end
  end
end
