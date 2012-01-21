class HomeController < ApplicationController
	def index
		@sprints = Sprint.find_all_by_status "active"
	end
	def about
	end
	def contact
	end
end

