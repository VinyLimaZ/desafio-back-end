class Store < ApplicationRecord
  validates :name, :owner_name, presence: :true

  before_save :sanitize_date

  private

  def sanitize_date
    self.owner_name = owner_name.squish
    self.name = name.squish
  end
end
