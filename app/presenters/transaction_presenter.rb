class TransactionPresenter
  delegate :document,
           :kind,
           :date_time,
           :card,
           :value, to: :@transaction


  def initialize(transaction)
    @transaction = transaction
  end

  def price
    h.number_with_precision(value / 100.0, precision: 2)
  end

  private

  def h
    ApplicationController.helpers
  end
end
