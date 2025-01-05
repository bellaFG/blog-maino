# C:\blog_maino\db\migrate\20250103234658_create_users.rb
class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :encrypted_password, default: "", null: false

      t.timestamps
    end

    add_index :users, :email, unique: true
  end
end
