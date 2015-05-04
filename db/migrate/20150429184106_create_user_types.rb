class CreateUserTypes < ActiveRecord::Migration
  def change
    create_table :user_types do |t|
      t.string :type
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :user_types, :users
  end
end
