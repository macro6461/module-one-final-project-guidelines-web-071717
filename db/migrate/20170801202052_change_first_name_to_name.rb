class ChangeFirstNameToName < ActiveRecord::Migration[5.0]
  def change
    rename_column :actors, :first_name, :name
  end
end
