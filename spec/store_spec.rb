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
end
