class Wiki < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged
  
  belongs_to :user
  has_and_belongs_to_many :users,  :join_table => :collaborators
end
