module ApplicationHelper

	def tab_title(page_title = '')
	  	if(page_title.empty?)
	  		"groupUp"
	  	else
	  		"groupUp | #{page_title}"
	  	end
	end

end

