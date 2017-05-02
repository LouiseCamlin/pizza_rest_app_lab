require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( './models/pizza.rb' )

#INDEX - read and see all the orders

get "/pizzas" do                   #always plural
  @pizzas = Pizza.all()
  erb(:index)
end

#CREATE 
get "/pizzas/new" do
  erb(:new)
end


#show - read
get "/pizzas/:id" do
  @pizza = Pizza.find(params[:id])
  erb(:show)
end

#create - save
post "/pizzas" do #same route but different requests
  @pizza = Pizza.new(params)
  @pizza.save()
  erb(:create)
end


#delete
post "/pizzas/:id/delete" do
  @pizza = Pizza.find(params[:id])
  @pizza.delete()
  erb(:destroy)

end

#edit
get "/pizzas/:id/edit" do
  @pizza = Pizza.find(params[:id])
  erb(:edit)
end

#update
post "/pizzas/:id" do
  @pizza = Pizza.new(params)
  @pizza.update()
  erb(:update)
end

