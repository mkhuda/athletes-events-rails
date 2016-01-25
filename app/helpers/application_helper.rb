module ApplicationHelper
	def active_class(link_path)
		current_page?(link_path) ? "text-muted" : ""
	end
	
	def active_action(string)
		if action_name == string
			"btn btn-sm btn-danger"
		else
			"btn btn-sm btn-default"
		end
	end
end
