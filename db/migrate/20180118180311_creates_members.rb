class CreatesMembers < ActiveRecord::Migration[5.1]
  def change
    create_table :members do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false

      t.belongs_to :house 

      t.timestamps null: false
    end
  end
end
