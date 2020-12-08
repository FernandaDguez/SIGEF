class AddEfacIdToInstructors < ActiveRecord::Migration[6.0]
  def change
    add_reference :instructors, :efac, null: false, foreign_key: true
  end
end
