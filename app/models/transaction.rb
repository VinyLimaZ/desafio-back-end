require 'action_view'

class Transaction < ApplicationRecord
  include ActionView::Helpers::NumberHelper

  belongs_to :store
  belongs_to :cnab

  before_save :sanitize_data

  validates :date_time, :value, :document, :card, presence: true
  PROFIT = ['debito', 'credito', 'recebimento emprestimo', 'vendas', 'recebimento TED', 'recebimento DOC']
  LOSS = ['boleto', 'financiamento', 'aluguel']

  enum kind: {
    debito: 1,
    boleto: 2,
    financiamento: 3,
    credito: 4,
    "recebimento emprestimo": 5,
    vendas: 6,
    "recebimento TED": 7,
    "recebimento DOC": 8,
    aluguel: 9,
  }

  # Extrair para um decorator
  def profit_or_loss
    PROFIT.include?(kind) ? 'Receita' : 'Despesa'
  end

  def price
    number_with_precision(value / 100.0, precision: 2)
  end

  private

  def sanitize_data
    self.document = document.squish
    self.card = card.squish
  end
end
