class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.string :long_url, unique: true, index: true
      t.string :short_url, unique: true, index: true
      t.integer :click_count, default: 0
      t.integer :user_id
    end
  end
end
