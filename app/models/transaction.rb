class Transaction < ApplicationRecord
  belongs_to :store
  belongs_to :cnab

end
