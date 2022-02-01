# frozen_string_literal: true

require 'winning'

RSpec.describe Winning do
  let(:game) { subject.instance_variable_get(:@game) }
  let(:counter) { subject.instance_variable_get(:@counter) }
  describe '#game_over' do
    context 'check all the winning conditions' do
      it 'returns nil when the game did not finish yet' do
        expect(subject.game_over).to be_nil
        expect(counter).to eq(1)
      end
    end
    context 'when palyer one win the game' do
      before do
        4.times do
          game.assign_input(game.a)
        end
      end
      it 'returns the "+" ' do
        expect(subject.game_over).to eq('+')
      end
    end
  end
  describe '#draw?' do
    it 'returns nil when the game not finish yet' do
      expect(subject.draw?).to be_nil
    end
    it 'returns draw when all cells are full with no winner' do
      subject.counter = 42
      expect(subject.draw?).to be_truthy
    end
  end
end
