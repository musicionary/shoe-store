class Brand < ActiveRecord::Base
  validates :name, presence: true
  has_and_belongs_to_many :stores
  before_save(:capitalize_name)

  private

    define_method(:capitalize_name) do
      self.name=(name().capitalize())
    end

end
