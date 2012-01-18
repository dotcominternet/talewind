class Task < ActiveRecord::Base
  
  belongs_to :story
  belongs_to :user
  
  def self.create_from_story story, estimate
    
    @task = Task.new
    
    @task.story_id = story.id
    @task.is_story = true
    @task.status = "open"
    @task.estimate = estimate
    
    @task.save
    
  end
  
end
