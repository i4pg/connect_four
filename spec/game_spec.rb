# frozen_string_literal: true

require 'game'

RSpec.describe Game do
  describe '#take_input' do
    context 'ask user for input' do
      before do
        allow(subject).to receive(:puts).with('Choose a column')
        allow(subject).to receive(:puts).with('[A, B, C, D, E, F, G]')
        allow(subject).to receive(:gets).and_return('a')
      end
      it 'send to #check_input' do
        allow(subject).to receive(:check_input).with('B').once
      end
    end
  end
  describe '#check_input' do
    context 'is it valid column?' do
      it 'retunrs input when enter a valid column' do
        valid_column = 'f'
        expect(subject.check_input(valid_column)).to eq(valid_column)
      end
    end
    context 'when enter invalid input once, then valid input' do
      it 'asks user again, then returns the valid input' do
        invalid_column = 4
        valid_column = 'e'
        expect(subject).to receive(:puts).with('invalid column').once
        expect(subject).to receive(:take_input).once
        subject.check_input(invalid_column)
        expect(subject.check_input(valid_column)).to eq(valid_column)
      end
    end
  end
end
