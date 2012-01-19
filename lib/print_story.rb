#!/usr/bin/env script/runner

require 'cups'
require 'prawn/qrcode'

id = ARGV.shift
print "Story #{id}\n"

story = Story.find id
print "Found: #{story}\n"

Prawn::Document.new :page_size => [326, 153], :margin => [0,30,10] do
	move_to 0,0
	render_qr_code RQRCode::QRCode.new("http://talewind.office/#{id}", :level => :h), :dot => 1.25

	fill_color '000000'

	font "#{Prawn::BASEDIR}/data/fonts/Chalkboard.ttf"
	font_size 11
	bounding_box [55,140], :width => 205, :height => 140 do
		text story.description
	end

	fill do
		polygon [5,0], [45,0], [45,90], [5,90]
		polygon [5,0], [300,0], [300,15], [5,15]
	end

	fill_color 'ffffff'
	stroke_color 'ffffff'

	font "#{Prawn::BASEDIR}/data/fonts/DejaVuSans.ttf"
	font_size 11
	bounding_box [140,12], :width => 120, :height => 20 do
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

	fill do
		polygon [57,12], [57,3], [48,3], [48,12]
	end

	bounding_box [60,12], :width => 80, :height => 20 do
		text "Complete?"
	end

	font_size 14
	bounding_box [10,5], :width => 80, :height => 40 do
		text "#{story.category}\n##{id}".upcase, :rotate => 90
	end

	render_file "test.pdf"
end

printer = "DYMO_LabelWriter_400_Turbo"
page = Cups::PrintJob.new "test.pdf", printer
page.job_options["PageSize"] = "w153h326"
page.job_options["scaling"] = "100"
page.job_options["landscape"] = "yes"
page.job_options["DymoHalftoning"] = "ErrorDiffusion"
page.job_options["DymoPrintQuality"] = "Graphics"
page.print

