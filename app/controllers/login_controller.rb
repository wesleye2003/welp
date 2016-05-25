get "/login" do
	erb :login
end

post '/login' do
  user = User.find_by(email: params[:email])
  user = user.authenticate(params[:password]) if user
  if user
		session[:user_id] = user.id
   	redirect "/"
	else
    @errors = ["Password/email combination is incorrect"]
    erb :login
  end
end

get "/logout" do
	session.delete(:user_id)
	redirect "/"
end