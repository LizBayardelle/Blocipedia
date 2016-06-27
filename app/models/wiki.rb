class Wiki < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :users,  :join_table => :collaborators
end
