module ApplicationHelper
	def active_class(link_path)
		current_page?(link_path) ? "text-muted" : ""
	end
	
	def active_action(string)
		if action_name == string
			"true"
		else 
			"false"
		end
	end
end
