require('bundler/setup')
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  erb(:index)
end

#########################
# stores
#########################

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
  if @store.save()
    redirect("/stores")
  else
    erb(:errors)
  end
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
  if @store.save()
    redirect("/stores")
  else
    erb(:errors)
  end
end

delete('/stores/:id') do
  @store = Store.find(params[:id])
  @store.destroy()
  redirect('/stores')
end


#########################
# brands
#########################

get('/brands') do
  @brands = Brand.all()
  erb(:brands)
end

post('/brands') do
  name = params[:name]
  @brand = Brand.create({name: name})
  if @brand.save()
    redirect("/brands")
  else
    erb(:errors)
  end
end

get('/brands/:id') do
  @brand = Brand.find(params['id'])
  erb(:store)
end
