require('bundler/setup')
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  erb(:index)
end

get('/stores') do
  @stores = Store.all()
  erb(:stores)
end

post('/stores') do
  name = params[:name]
  street = params[:street]
  city = params[:city]
  state = params[:state]
  zip = params[:zip]
  phone_number = params[:phone_number]
  owner = params[:owner]

  @store = Store.create({name: name, street: street, city: city, state: state, zip: zip, phone_number: phone_number, owner: owner})
  redirect("/stores")
end

get('/stores/:id') do
  @store = Store.find(params['id'])
  erb(:store)
end

get('/stores/:id/edit') do
  @store = Store.find(params[:id])
  erb(:store_edit)
end

patch('/stores/:id') do
  @store = Store.find(params[:id])
  name = params[:name]
  street = params[:street]
  city = params[:city]
  state = params[:state]
  zip = params[:zip]
  phone_number = params[:phone_number]
  owner = params[:owner]

  @store.update({name: name, street: street, city: city, state: state, zip: zip, phone_number: phone_number, owner: owner})
  redirect("/stores/#{@store.id()}")
end

delete('/stores/:id') do
  @store = Store.find(params[:id])
  @store.destroy()
  redirect('/stores')
end
