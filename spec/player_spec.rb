# frozen_string_literal: true

require 'player'

RSpec.describe Players do
  subject { described_class.new }
  let(:one) { subject.instance_variable_get(:@player_one) }
  let(:two) { subject.instance_variable_get(:@player_two) }
  let(:curr) { subject.instance_variable_get(:@current_player) }
  describe '#switch_player' do
    context 'switching between players' do
      it 'switch to player two when current player is player one' do
        subject.switch_player
        expect(curr).to eq(two)
      end
    end
  end
end
