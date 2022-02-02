# frozen_string_literal: true

require 'winning'

RSpec.describe Winning do
  describe '#game_over' do
    context 'check all the winning conditions' do
      it 'returns nil when the game did not finish yet' do
        expect(subject.game_over).to be_nil
        expect(subject.counter).to eq(1)
      end
    end
    context 'when palyer one win the game' do
      before do
        subject.counter = 7 # game_over starts work after the 7th move
        4.times do
          subject.game.assign_input(subject.game.a)
        end
      end
      it 'returns "+" ' do
        expect(subject).to receive(:congrats).with('+').once
        subject.game_over
      end
    end
  end
  describe '#draw?' do
    it 'returns nil when the game not finish yet' do
      expect(subject.draw?).to be_nil
    end
    it 'returns draw when all cells are full with no winner' do
      subject.counter = 42
      expect(subject).to receive(:puts).with("It's a draw !!")
      expect { subject.draw? }.to change { subject.over }.to be_truthy
    end
  end
end
