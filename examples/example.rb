require 'padrino-tutorial/message'
require 'sinatra'

space = []

space << Message.new("Hi", "Ankita")
space << Message.new("Hi!", "Darío")
space << Message.new("How're things?", "Darío")
space << Message.new("Good, and you?", "Ankita")
space << Message.new("Good thanks :) Chat soon!", "Darío")
space << Message.new("Sure, bye!", "Ankita")

# space.each do |message|
#   puts message.to_s
# end

def messages(space)
  space.map do |message|
    message.to_s
  end
end

get '/' do
  messages(space).join "<br>"
end

get '/.spoken' do
  messages(space).join "\n"
end

get '/new' do
  %Q{
<form action='/' method='POST'>
  <textarea name=what></textarea>
  <input type=text name=who placeholder=Who />
  <input type=submit />
</form>
}
end

post '/' do
  space << Message.new(params['what'], params['who'])
  redirect '/'
end
