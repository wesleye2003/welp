get "/restaurants" do
	@restaurants = Restaurant.all
	erb :"restaurants/index"
end

get "/restaurants/new" do
	if current_user
		erb :"restaurants/new"
	else
		redirect "/login"
	end
end

post "/restaurants" do 
	if current_user
		restaurant = current_user.restaurants.new(params['restaurant'])
		if restaurant.save
			redirect "/restaurants/#{restaurant.id}"
		else
			@errors = restaurant.errors.full_messages
			erb :"restaurants/new"
		end
	else
		redirect "/login"
	end
end

get "/restaurants/:id" do
	@restaurant = Restaurant.find(params[:id])
	erb :"restaurants/show"
end

get "/restaurants/:id/edit" do
	@restaurant = Restaurant.find(params[:id])
	erb :"restaurants/edit"
end

delete "/restaurants/:id" do
	restaurant = Restaurant.find(params[:id])
	if current_user == restaurant.user 
		restaurant.destroy
		redirect "/"
	else
		redirect "/"
	end
end

put "/restaurants/:id" do
	@restaurant = Restaurant.find(params['id'])
	if current_user == @restaurant.user 
		@restaurant.assign_attributes(params['restaurant'])
		if @restaurant.save
			redirect "/restaurants/#{@restaurant.id}"
		else
			@errors = @restaurant.errors.full_messages
			erb :"restaurants/edit"
		end
	else
		redirect "/"
	end
end