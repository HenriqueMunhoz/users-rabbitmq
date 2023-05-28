class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :full_name
      t.string :email
      t.date :birthday
      t.string :identification_code

      t.timestamps
      t.index :email, unique: true
    end
  end
end
