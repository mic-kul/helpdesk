class Ticket < ActiveRecord::Base
  attr_accessible :topic, :message, :user, :category, :category_id
  has_many :answers
  belongs_to :user
  belongs_to :category
  
end
