class ResumePdf < Prawn::Document
  def initialize(resume, view)
    super(top_margin: 70)
    @resume = resume
    @view = view
    resume_title
  end

  def resume_title
    text "#{@resume.name}", size: 30, style: :bold
  end

  def line_items
    move_down 20
    table line_item_rows do
      row(0).font_style = :bold
      columns(1..3).align = :right
      self.row_colors = ["DDDDDD", "FFFFFF"]
      self.header = true
    end
  end

  def line_item_rows
    [["Product", "Qty", "Unit Price", "Full Price"]] +
    @order.line_items.map do |item|
      [item.name, item.quantity, price(item.unit_price), price(item.full_price)]
    end
  end

  def price(num)
    @view.number_to_currency(num)
  end

  def total_price
    move_down 15
    text "Total Price: #{price(@order.total_price)}", size: 16, style: :bold
  end
end
