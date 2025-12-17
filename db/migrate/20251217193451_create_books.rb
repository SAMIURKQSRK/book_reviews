class CreateBooks < ActiveRecord::Migration[7.2]
  def change
    create_table :books do |t|
      t.string :title, limit: 100, null: false

      t.timestamps
    end
  end
end
