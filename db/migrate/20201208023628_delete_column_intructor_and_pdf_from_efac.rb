class DeleteColumnIntructorAndPdfFromEfac < ActiveRecord::Migration[6.0]
  def change
    remove_column :efacs, :instructor_name
    remove_column :efacs, :instructor_experience

  end
end
