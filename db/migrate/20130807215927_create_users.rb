class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, unique: true
      t.string :email, unique: true, index: true
      t.string :password_hash
    end
  end
end
