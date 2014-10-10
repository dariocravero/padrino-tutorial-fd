Example::App.controller provides: [:json, :html] do
  # READ ALL
  get :index, provides: [:spoken, :json, :html] do
    @title = 'Chat!'
    @action = url(:index)
    @messages = space
    @message = Message.new('What?', 'Who?')
    render :index
  end

  # READ
  get :message, map: '/:id' do
    id = params['id'].to_i
    @title = "Message #{id}"
    @message = space[id]
    render :message
  end

  # CREATE
  post :index do
    space << Message.new(params['what'], params['who'])
    redirect url(:index)
  end

  # UPDATE
  put :message, map: '/:id', params: [:message, :id] do
    id = params['id'].to_i
    @message = space[id]
    @message.what = params['message']['what'] if params['message']['what']
    @message.who = params['message']['who'] if params['message']['who']
    space[id] = @message
    redirect url(:message, id)
  end

  # REMOVE
  delete :message, map: '/:id' do
    # TODO Implement ?
    # How would you implement it here?
    # How would you implement it in the view? So that a user can actually delete something.
  end

  ## VIEW
  get :new, provides: :html do
    @title = 'New message'
    @action = url(:index)
    @message = Message.new
    @method = 'POST'
    render :new
  end

  get :edit, with: :id, provides: :html do
    id = params['id'].to_i
    @title = "Message #{id}"
    @action = url(:message, id)
    @message = space[id]
    @method = 'PUT'
    render :edit
  end
end
