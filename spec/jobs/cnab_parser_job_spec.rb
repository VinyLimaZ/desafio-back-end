describe CnabParserJob do
  describe 'parser the cnab' do
    let(:cnab) { create(:cnab) }

    describe 'to create a store model' do
      let(:store) { build(:store, owner_name: 'JOÃO MACEDO', name: 'BAR DO JOÃO') }
      before { described_class.perform_now(cnab.id) }

      it 'with parsed data' do
        expect(Store.last.name).to eq store.name
        expect(Store.last.owner_name).to eq store.owner_name
      end
    end

    describe 'to create a transaction model' do
      let(:transaction) do
        TransactionPresenter.new(
          build(:transaction,
              kind: 'financiamento',
              value: '00014200' ,
              document: '09620676017',
              card: '4753****3153',
              date_time: Time.local('2019', '03', '01', '15', '34', '53')
             ))
      end

      before { described_class.perform_now(cnab.id) }

      it 'with parsed data' do
        expect(Transaction.last.kind).to eq transaction.kind
        expect(Transaction.last.value).to eq transaction.value
        expect(Transaction.last.card).to eq transaction.card
        expect(Transaction.last.document).to eq transaction.document
      end
    end
  end
end
