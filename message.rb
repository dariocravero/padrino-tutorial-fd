def message(what, who, time)
  [what, who, time]
end

test "I can write a message" do
  what, _, _ = message 'hi', 'Darío', Time.now

  assert_equal 'hi', what
end

test "I can tell who wrote the message" do
  _, who, _ = message 'hi', 'Darío', Time.now

  assert_equal 'Darío', who
end

test "I can tell when the message was written" do
  timestamp = Time.now
  _, _, time = message 'hi', 'Darío', timestamp

  assert_equal time, timestamp
end
