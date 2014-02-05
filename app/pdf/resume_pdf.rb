class ResumePdf < Prawn::Document
  def initialize(resume, view)
    super(top_margin: 70)
    @resume = resume
    @view = view
    print_resume_title

    @resume.areas.each do |area|
      print_areas(area)
    end

    stroke_axis
    stroke_circle [0, 0], 10
    bounding_box([100, 300], :width => 300, :height => 200) do
     stroke_bounds
     stroke_circle [0, 0], 10
    end

 end

 def print_resume_title
  text "#{@resume.name}", size: 30, style: :bold
end

def print_areas(area)
  move_down 20
  text "#{area.name}", size: 20, style: :bold
  area.area_attributes.each do |a|
    print_area_attributes(a)
  end
end

def print_area_attributes(attribute)
  text "#{attribute.name}", size: 10, style: :bold
  text "#{attribute.value}", size:10
end
end
