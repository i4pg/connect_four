# frozen_string_literal: true

require 'player'

RSpec.describe Players do
  subject { described_class.new }
  let(:one) { subject.instance_variable_get(:@player_one) }
  let(:two) { subject.instance_variable_get(:@player_two) }
  let(:curr) { subject.instance_variable_get(:@current_player) }
  describe '#take_input' do
    context 'ask user for input' do
      before do
        allow(subject).to receive(:puts).with('Choose a column')
        allow(subject).to receive(:puts).with('[A, B, C, D, E, F, G]')
        allow(subject).to receive(:gets).and_return('a')
      end
      it 'returns true' do
        expect(subject.take_input).to eq('a')
      end
    end
  end
  describe '#switch_player' do
    context 'switching between players' do
      it 'switch to player two when current player is player one' do
        subject.switch_player
        expect(curr).to eq(two)
      end
    end
  end
end
