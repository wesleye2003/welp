post "/restaurants/:id/reviews" do 
	@restaurant = Restaurant.find(params[:id])
	if current_user
		review = @restaurant.reviews.new(params['review'])
		review.user = current_user
		if review.save
			@thanks = "Thanks for your review!"
			erb :"restaurants/show"
		else
			@errors = review.errors.full_messages
			erb :"restaurants/show"
		end
	else
		redirect "/"
	end
end