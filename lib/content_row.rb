class ContentRow
  attr_reader :row_number, :cost, :capacity, :contents
  
  def initialize(data)
    @row_number = data[0]
    @cost       = data[1]["cost"]
    @capacity   = data[1]["capacity"]
    @contents   = data[1]["contents"]
  end
end