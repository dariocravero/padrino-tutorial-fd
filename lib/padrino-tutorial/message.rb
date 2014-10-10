class Message
  attr_accessor :what, :who, :time

  def initialize(what, who, time=Time.now)
    @what = what
    @who  = who
    @time = time
  end

  def to_s
    "#{@who}: #{@what}"
  end
end
