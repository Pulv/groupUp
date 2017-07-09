module ApplicationHelper

	def tab_title(page_title = '')
	  	if(page_title.empty?)
	  		default
	  	else
	  		"groupUp | #{page_title}"
	  	end
	end

end

