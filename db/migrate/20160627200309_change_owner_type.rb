class ChangeOwnerType < ActiveRecord::Migration
  def change
    change_column :wikis, :owner, :integer
  end
end
