module ApplicationHelper
	def active_class(link_path)
		current_page?(link_path) ? "text-muted" : ""
	end
end
