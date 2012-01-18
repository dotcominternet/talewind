class Story < ActiveRecord::Base
  
  has_many :tasks
  belongs_to :sprint
  
  validates_numericality_of :business_value, :allow_nil => true, :less_than_or_equal_to => 100, :greater_than_or_equal_to => 0
  validates_numericality_of :technical_value, :allow_nil => true, :less_than_or_equal_to => 100, :greater_than_or_equal_to => 0
  
end
