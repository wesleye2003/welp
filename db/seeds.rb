User.create({
	email: 'wes@wes.com',
	password: 'password'
	})

20.times do 
	User.create({
		email: Faker::Internet.email,
		password: 'password'
		})
end

57.times do 
	Restaurant.create({
		name: Faker::Hipster.words(2).join(" "),
		cuisine: Faker::StarWars.specie+" Style Dining",
		state: Faker::Address.state_abbr,
		city: Faker::Address.city,
		address: Faker::Address.street_address,
		zip: rand(10000..99999),
		user_id: rand(1..21)
		})
end

200.times do 
	Review.create({
		restaurant_id: rand(1..57),
		user_id: rand(2..20),
		rating: rand(1..5), 
		body: Faker::Hipster.paragraph
		})
end