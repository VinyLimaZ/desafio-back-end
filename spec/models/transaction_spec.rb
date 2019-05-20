require 'rails_helper'

describe Transaction, type: :model do
  describe 'validation' do
    it { is_expected.to validate_presence_of :date_time }
    it { is_expected.to validate_presence_of :value }
    it { is_expected.to validate_presence_of :document }
    it { is_expected.to validate_presence_of :card }
  end

  describe '#kind' do
    context 'return the right value' do
      subject { build(:transaction, kind: 4).kind }

      it { is_expected.to eq 'credito' }
    end
  end

  describe 'construct a normalized transaction' do
    let(:transaction) do
        create(:transaction, document: '12345678901    ')
    end

    it 'removes blank spaces on card/document' do
      expect(transaction.document).to eq('12345678901')
    end
  end
end
