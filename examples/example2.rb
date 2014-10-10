require 'padrino-tutorial/message'
require 'sinatra/base'

class App < Sinatra::Base
  set :space, [
    Message.new("Hi", "Ankita"),
    Message.new("Hi!", "Darío"),
    Message.new("How're things?", "Darío"),
    Message.new("Good, and you?", "Ankita"),
    Message.new("Good thanks :) Chat soon!", "Darío"),
    Message.new("Sure, bye!", "Ankita")
  ]

  helpers do
    def messages
      settings.space.map do |message|
        message.to_s
      end
    end
  end

  get '/' do
    messages.join "<br>"
  end

  get '/.spoken' do
    messages.join "\n"
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
    settings.space << Message.new(params['what'], params['who'])
    redirect '/'
  end

  run! if app_file == $0
end
