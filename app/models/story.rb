class Story < ActiveRecord::Base
  
  has_many :tasks
  belongs_to :sprint
  
end
