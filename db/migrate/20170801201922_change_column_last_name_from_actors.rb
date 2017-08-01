class ChangeColumnLastNameFromActors < ActiveRecord::Migration[5.0]
  def change
    remove_column :actors, :last_name, :string
  end
end
