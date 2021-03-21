class CreateCountries < ActiveRecord::Migration[5.2]
  def change
    create_table :countries do |t|
      t.references :short
      t.string :name 
      t.string :ip_add
      t.timestamps
    end
  end
end
