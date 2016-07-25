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
  @brands = Brand.all()
  erb(:store)
end

get('/stores/:id/edit') do
  @store = Store.find(params[:id])
  @brands = Brand.all()
  erb(:store_edit)
end

patch('/stores/:id/brands') do
  @store = Store.find(params[:id])
  @brands = Brand.all()
  @brands.each() do |brand|
    brand_id = params["#{brand.id()}"]
    if brand_id
      brand = Brand.find((brand_id).to_i())
      @store.brands.push(brand)
    end
  end
  redirect("/stores/#{@store.id()}")
end

patch('/stores/:id') do
  @store = Store.find(params[:id])
  @brands = Brand.all()
  name = params[:name]
  street = params[:street]
  city = params[:city]
  state = params[:state]
  zip = params[:zip]
  phone_number = params[:phone_number]
  owner = params[:owner]
  # @brands.each() do |brand|
  #   brand_id = params["#{brand.id()}"]
  #   if brand_id
  #     brand = Brand.find((brand_id).to_i())
  #     @store.brands.push(brand)
  #   end
  # end
  @store.update({name: name, street: street, city: city, state: state, zip: zip, phone_number: phone_number, owner: owner})
  if @store.save()
    redirect("/stores/#{@store.id()}")
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
    erb(:brand_errors)
  end
end

get('/brands/:id') do
  @brand = Brand.find(params['id'])
  erb(:brand)
end
