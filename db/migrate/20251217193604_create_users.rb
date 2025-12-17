class CreateUsers < ActiveRecord::Migration[7.2]
  def change
    create_table :users do |t|
      t.string :name, limit: 100, null: false
      t.boolean :banned, default: false

      t.timestamps
    end
  end
end
