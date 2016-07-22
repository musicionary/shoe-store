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
end
