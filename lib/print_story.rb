#!/usr/bin/env script/runner

require 'cups'
require 'prawn/qrcode'

id = ARGV.shift
print "Story #{id}\n"

story = Story.find id
print "Found: #{story}\n"

Prawn::Document.new :page_size => [115, 54], :margin => [3]  do
	render_qr_code RQRCode::QRCode.new("http://talewind.office/#{id}", :level => :h), :dot => 0.45

	font "#{Prawn::BASEDIR}/data/fonts/Chalkboard.ttf"
	font_size 5
	bounding_box [20,47], :width => 85, :height => 50 do
		text story.description
	end

	font "#{Prawn::BASEDIR}/data/fonts/DejaVuSans.ttf"
	font_size 5
	bounding_box [60,5], :width => 60, :height => 20 do
		bv = 0
		tv = 0
		bv = story.business_value unless story.business_value.blank?
		tv = story.technical_value unless story.technical_value.blank?
		v = '?'
		v = bv + tv if bv > 0 and tv > 0
		bv = '?' if bv == 0
		tv = '?' if tv == 0

		text "BV: #{bv}  TV: #{tv}  [#{v}]"
	end

	bounding_box [28,5], :width => 30, :height => 20 do
		text "Complete?"
	end

	stroke do
		line_width 0.5
		polygon [26,5], [26,1], [22,1], [22,5]
	end

	font_size 6
	bounding_box [2,1], :width => 50, :height => 30 do
		text "#{story.category}\n##{id}", :rotate => 90
	end

	render_file "test.pdf"
end

page = Cups::PrintJob.new "test.pdf", :printer => "DYMO_LabelWriter_400_Turbo___Potential"
page.print

