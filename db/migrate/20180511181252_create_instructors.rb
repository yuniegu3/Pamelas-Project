class CreateInstructors < ActiveRecord::Migration[5.2]
  def change
    create_table :instructors do |t|
      t.string :firstname
      t.string :lastname
      t.integer :age
      t.integer :salary
      t.string :education
      t.string :subject

      t.timestamps
    end
  end
end
