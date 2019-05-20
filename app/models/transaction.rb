class Transaction < ApplicationRecord
  belongs_to :store
  belongs_to :cnab

  before_save :sanitize_data

  validates :date_time, :value, :document, :card, presence: true

  enum kind: {
    debito: 1,
    boleto: 2,
    financiamento: 3,
    credito: 4,
    "recebimento emprestimo": 5,
    vendas: 6,
    "recebimento TED": 6,
    "recebimento DOC": 7,
    aluguel: 8
  }

  private

  def sanitize_data
    self.document = document.squish
    self.card = card.squish
  end
end
