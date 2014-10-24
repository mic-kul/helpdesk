class Answer < ActiveRecord::Base
  attr_accessible :ticket, :user, :message
  belongs_to :user
  belongs_to :ticket
end
