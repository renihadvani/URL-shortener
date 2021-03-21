class CreateShorts < ActiveRecord::Migration[5.2]
  def change
    create_table :shorts do |t|
      t.string :url 
      t.integer :count, default: 0
      t.string :slug
      t.date :expire_date
      t.timestamps
    end
  end
end
