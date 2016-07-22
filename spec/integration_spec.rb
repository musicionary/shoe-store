require("spec_helper")

describe("the stores path", {:type => :feature}) do
  it('should let you create a store') do
    visit('/stores')
    fill_in('name', :with => "John's New Shoes Plus")
    fill_in('street', :with => "123 Main Street")
    fill_in('city', :with => "Lexington")
    fill_in('state', :with => "KY")
    fill_in('zip', :with => "40506")
    fill_in('phone_number', :with => "555-123-1234")
    fill_in('owner', :with => "Franz Schubert")
    click_on('Create')
    expect(page).to have_content("John's New Shoes Plus")
  end

  it("should show the stores") do
    test_store = Store.create({name: "John's New Shoes Plus", street: "123 Main Street", city: "Lexington", state: "KY", zip: "40506", phone_number: "555-123-1234", owner: "Franz Schubert"})
    visit('/stores')
    expect(page).to have_content("#{test_store.name()}")
  end

  it('should show an individual store') do
    test_store = Store.create({name: "John's New Shoes Plus", street: "123 Main Street", city: "Lexington", state: "KY", zip: "40506", phone_number: "555-123-1234", owner: "Franz Schubert"})
    visit("/stores/#{test_store.id()}")
    expect(page).to have_content("#{test_store.name()}")
  end

  it('should let you edit a store name') do
    test_store = Store.create({name: "John's New Shoes Plus", street: "123 Main Street", city: "Lexington", state: "KY", zip: "40506", phone_number: "555-123-1234", owner: "Franz Schubert"})
    visit("/stores/#{test_store.id()}")
    click_on("Edit")
    fill_in('name', :with => "Mizuno Shoes")
    fill_in('street', :with => "123 Main Street")
    fill_in('city', :with => "Lexington")
    fill_in('state', :with => "KY")
    fill_in('zip', :with => "40506")
    fill_in('phone_number', :with => "555-123-1234")
    fill_in('owner', :with => "Franz Schubert")
    click_on("Edit Store")
    expect(page).to have_content("Mizuno Shoes")
  end

  it('should let you delete a store') do
    test_store = Store.create({name: "John's New Shoes Plus", street: "123 Main Street", city: "Lexington", state: "KY", zip: "40506", phone_number: "555-123-1234", owner: "Franz Schubert"})
    visit("/stores")
    click_on("delete")
    test_store.destroy()
    expect(page).to have_content("Add a New Store")
  end
end



# describe("the stores path", {:type => :feature}) do
#   it('should let you create a store') do
#     visit('/stores')
#     fill_in('name', :with => "John's New Shoes Plus")
#     fill_in('street', :with => "123 Main Street")
#     fill_in('city', :with => "Lexington")
#     fill_in('state', :with => "KY")
#     fill_in('zip', :with => "40506")
#     fill_in('phone_number', :with => "555-123-1234")
#     fill_in('owner', :with => "Franz Schubert")
#     click_on('Create')
#     expect(page).to have_content("John's New Shoes Plus")
#   end
#
#   it("should show the stores") do
#     test_store = Store.create({name: "John's New Shoes Plus", street: "123 Main Street", city: "Lexington", state: "KY", zip: "40506", phone_number: "555-123-1234", owner: "Franz Schubert"})
#     visit('/stores')
#     expect(page).to have_content("#{test_store.name()}")
#   end
#
#   it('should show an individual store') do
#     test_store = Store.create({name: "John's New Shoes Plus", street: "123 Main Street", city: "Lexington", state: "KY", zip: "40506", phone_number: "555-123-1234", owner: "Franz Schubert"})
#     visit("/stores/#{test_store.id()}")
#     expect(page).to have_content("#{test_store.name()}")
#   end
#
#   it('should let you edit a store name') do
#     test_store = Store.create({name: "John's New Shoes Plus", street: "123 Main Street", city: "Lexington", state: "KY", zip: "40506", phone_number: "555-123-1234", owner: "Franz Schubert"})
#     visit("/stores/#{test_store.id()}")
#     click_on("Edit")
#     fill_in('name', :with => "Mizuno Shoes")
#     fill_in('street', :with => "123 Main Street")
#     fill_in('city', :with => "Lexington")
#     fill_in('state', :with => "KY")
#     fill_in('zip', :with => "40506")
#     fill_in('phone_number', :with => "555-123-1234")
#     fill_in('owner', :with => "Franz Schubert")
#     click_on("Edit Store")
#     expect(page).to have_content("Mizuno Shoes")
#   end
#
#   it('should let you delete a store') do
#     test_store = Store.create({name: "John's New Shoes Plus", street: "123 Main Street", city: "Lexington", state: "KY", zip: "40506", phone_number: "555-123-1234", owner: "Franz Schubert"})
#     visit("/stores")
#     click_on("delete")
#     test_store.destroy()
#     expect(page).to have_content("Add a New Store")
#   end
# end
