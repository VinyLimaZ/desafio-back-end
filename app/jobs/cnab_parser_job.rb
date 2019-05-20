class CnabParserJob < ApplicationJob
  queue_as :default

  def perform(cnab_id)
    cnab = Cnab.find(cnab_id)
    cnab.file.each_line do |line|
      store = create_store(line)
      create_transaction(line, cnab_id, store.id)
    end
  end

  private

  def create_store(line)
    name = line.byteslice(Cnab::STORE_NAME)
    owner_name = line.byteslice(Cnab::OWNER_STORE_NAME)
    Store.create(name: name, owner_name: owner_name)
  end

  def create_transaction(line, cnab_id, store_id)
    kind = line.byteslice(Cnab::KIND).to_i
    value = line.byteslice(Cnab::VALUE)
    document = line.byteslice(Cnab::DOCUMENT)
    card = line.byteslice(Cnab::CARD)
    date = line.byteslice(Cnab::DATE)
    time = line.byteslice(Cnab::TIME)
    date_time = new_date_time(date, time)

    Transaction.create(
      kind: kind,
      value: value,
      document: document,
      card: card,
      date_time: date_time,
      store_id: store_id,
      cnab_id: cnab_id
    )
  end

  def new_date_time(date, time)
    year = date.byteslice(0..3)
    month = date.byteslice(4..5)
    day =  date.byteslice(6..7)
    hour = time.byteslice(0..1)
    minute = time.byteslice(2..3)
    seconds = time.byteslice(4..5)
    Time.local(year, month, day, hour, minute, seconds)
  end
end
