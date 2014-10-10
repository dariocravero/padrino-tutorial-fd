require 'padrino-tutorial/message'

setup do
  Message.new 'hi', 'Darío'
end

test "I can write a message" do |message|
  assert_equal 'hi', message.what
end

test "I can tell who wrote a message" do |message|
  assert_equal 'Darío', message.who
end

test "I can tell when someone wrote a message" do
  time = Time.now
  message = Message.new 'hi', 'Darío', time

  assert_equal time, message.time
end

test "show a message in a nice format" do |message|
  assert_equal message.to_s, "#{message.who}: #{message.what}"
end
