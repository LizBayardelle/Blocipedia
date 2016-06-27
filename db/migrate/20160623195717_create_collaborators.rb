class CreateCollaborators < ActiveRecord::Migration
  def change
    create_table :collaborators do |t|
      t.integer :user_id, array: true, default: []
      t.integer :wiki_id
    end

    add_index :users, :id, unique: true
    add_index :wikis, :id, unique: true
  end
end
