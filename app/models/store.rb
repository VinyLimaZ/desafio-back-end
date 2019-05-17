class Store < ApplicationRecord
  validates :name, :owner_name, presence: :true
end
