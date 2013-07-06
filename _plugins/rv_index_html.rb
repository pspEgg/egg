module Jekyll
	module RemoveIndexHTMLFilter
		def rm_index_html(input)
			input.match(/(.*)\/index\./)[1]
		end
	end
end
Liquid::Template.register_filter(Jekyll::RemoveIndexHTMLFilter)