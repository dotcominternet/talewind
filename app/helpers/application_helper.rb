# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
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
end
