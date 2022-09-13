class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add routes
  get '/messages' do
    messages = Message.all
    messages.to_json
  end

  post '/messages' do
    new_message = Message.create(body: params[:body], username: params[:username])
    new_message.to_json
  end

  patch '/messages/:id' do
    body_update = Message.find(params[:id])
    body_update.update(
      body: params[:body])
      body_update.to_json
  end

  delete '/messages/:id' do
    delete_message = Message.find(params[:id])
    delete_message.destroy
    # delete_message.to_json
  end
  
end
