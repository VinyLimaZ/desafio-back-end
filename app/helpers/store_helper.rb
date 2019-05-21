module StoreHelper
  def profits(transactions)
    profits = transactions.select { |t| Transaction::PROFIT.include? t.kind }
    profits.map(&:value).reduce(0) { |total, item| total += item }
  end

  def losses(transactions)
    losses = transactions.select { |t| Transaction::LOSS.include? t.kind }
    loss = losses.map(&:value).reduce(0) { |total, item| total += item }
  end

  def final_value(transactions)
    profits(transactions) - losses(transactions)
  end
end
