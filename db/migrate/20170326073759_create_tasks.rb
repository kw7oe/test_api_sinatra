class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :people do |t|
      t.string :name
      t.string :gender
      t.integer :age
    end
  end
end
