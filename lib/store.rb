class Store < ActiveRecord::Base
  validates :name, :street, :city, :state, :owner, presence: true
  validates(:zip, :presence => true, length: { is: 5 }, numericality: true)
  validates(:phone_number, :presence => true, length: { in: 10..12 })
end
