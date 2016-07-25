require('spec_helper')

describe(Store) do
  it("validates presence of name") do
    store = Store.new({:name => ""})
    expect(store.save()).to(eq(false))
  end
  it("validates presence of street") do
    store = Store.new({:street => ""})
    expect(store.save()).to(eq(false))
  end
  it("validates presence of city") do
    store = Store.new({:city => ""})
    expect(store.save()).to(eq(false))
  end
  it("validates presence of state") do
    store = Store.new({:state => ""})
    expect(store.save()).to(eq(false))
  end
  it("validates presence of zip") do
    store = Store.new({:zip => ""})
    expect(store.save()).to(eq(false))
  end
  it("validates presence of phone_number") do
    store = Store.new({:phone_number => ""})
    expect(store.save()).to(eq(false))
  end
  it("validates presence of owner") do
    store = Store.new({:owner => ""})
    expect(store.save()).to(eq(false))
  end

  it('should have many brands') do
    store = Store.create({name: "John's New Shoes Plus", street: "123 Main Street", city: "Lexington", state: "KY", zip: "40506", phone_number: "555-123-1234", owner: "Franz Schubert"})
    brand = Brand.create({:name => "brooks"})
    brand2 = Brand.create({:name => "asics"})
    store.brands.push(brand)
    store.brands.push(brand2)
    expect(store.brands()).to(eq([brand, brand2]))
  end
end
