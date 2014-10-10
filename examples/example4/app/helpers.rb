Example::App.helpers do
  def space
    settings.space
  end

  def messages
    space.map do |message|
      message.to_s
    end
  end
end
