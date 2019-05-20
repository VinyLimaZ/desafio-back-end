describe TransactionPresenter do
  let(:transaction) { create(:transaction) }
  subject { described_class.new(transaction).price }

  describe '#price' do
    describe 'return a meaningful value' do
      it { is_expected.to eq('123.45') }
    end
  end
end
