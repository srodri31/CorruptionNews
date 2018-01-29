class CreatePersistences < ActiveRecord::Migration[5.1]
  def change
    create_table :persistences do |t|
      t.string :name
      t.string :value

      t.timestamps
    end
  end
end
