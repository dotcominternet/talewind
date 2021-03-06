# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
	@@md = Redcarpet::Markdown.new(Redcarpet::Render::HTML.new(:no_images => true, :safe_links_only => true, :hard_wrap => true))

	def markdown(text)
		@@md.render text
	end
	
  def set_focus(e)
    javascript_tag("$('##{e}').focus()");
  end
  
  def display_field(opts)
    opts = {:type => :uneditable, :value => '', :name => '', :field => false}.merge!(opts)

	value = opts[:value]

	field = ''
	if (opts[:field])
		field = " id=\"#{opts[:field]}\" name=\"#{opts[:field]}\" "
	end

	case opts[:type]
		when :uneditable
			value = "<span class=\"uneditable-input\">#{h value}</span>"
		when :textarea
			value = "<textarea class=\"xxlarge\"#{field} rows=\"3\">#{h value}</textarea>"
		when :text
			value = "<input class=\"xlarge\" #{field} size=\"30\" type=\"text\" value=\"#{h value}\"/>"
		else
			value = h value
	end

    "<div class=\"clearfix\"><label>#{opts[:name]}</label><div class=\"input\">#{value}</div></div>"
  end

	def in_hours(minutes)
		return "no" if minutes.nil?
		if minutes < 1 then
			"0h"
		else
			hours = (minutes / 60).floor
			minutes = minutes - (hours * 60)

			if hours > 0 then
				"#{minutes}m"
				if minutes > 0 then
					"#{hours}h #{minutes}m"
				else
					"#{hours}h"
				end
			else
				"#{minutes}m"
			end
		end
	end

	def max_length(text, chars)
		if text.length > chars
			dest = []
			len = 0
			text.split(" ").each do |word|
				len += word.length
				if len < chars
					dest.push word
				end
			end

			if dest.length == 0
				dest.push text.slice(0,chars)
			end
			
			text = dest.join(" ") + "..."
		end
		text
	end
end
