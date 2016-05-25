class CreateRestaurants < ActiveRecord::Migration
  def change
  	create_table :restaurants do |t|
  		t.text     :name, null: false
  		t.text     :cuisine, null: false
  		t.text     :state
  		t.text     :city
  		t.text     :address
  		t.integer  :zip
  		t.integer  :user_id

  		t.timestamps null:false
  	end
  end
end
