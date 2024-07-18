class CreateEntries < ActiveRecord::Migration[7.1]
  def change
    create_table :entries do |t|
      t.integer :number
      t.string :title
      t.integer :points
      t.integer :comments

      t.timestamps
    end
  end
end
