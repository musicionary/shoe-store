require('spec_helper')

describe(Brand) do
  it("validates presence of name") do
    brand = Brand.new({:name => ""})
    expect(brand.save()).to(eq(false))
  end

  it("converts the name to capitalized version") do
    brand = Brand.create({:name => "brooks"})
    expect(brand.name()).to(eq("Brooks"))
  end

  it('should have many stores') do
    brand = Brand.create({:name => "brooks"})
    store = Store.create({name: "John's New Shoes Plus", street: "123 Main Street", city: "Lexington", state: "KY", zip: "40506", phone_number: "555-123-1234", owner: "Franz Schubert"})
    store2 = Store.create({name: "Fleet Flyers", street: "123 Main Street", city: "Bellvue", state: "KY", zip: "40506", phone_number: "555-123-1234", owner: "John Mike"})
    brand.stores.push(store)
    brand.stores.push(store2)
    expect(brand.stores()).to(eq([store, store2]))
  end
end
