# frozen_string_literal: true

require_relative '../lib/knight'

describe Knight do
  subject(:knight) { described_class.new }

  describe '#out_of_bounds?' do
    context 'When a field is on the board' do
      it 'returns false' do
        expect(knight.out_of_bounds?([0, 0])).to eq(false)
      end
    end

    context 'When a field is not on the board' do
      it 'returns true' do
        expect(knight.out_of_bounds?([0, 8])).to eq(true)
      end

      it 'returns true' do
        expect(knight.out_of_bounds?([8, 0])).to eq(true)
      end
    end
  end

  describe '#valid_moves' do
    context 'When position is [0, 0]' do
      it 'returns two valid moves' do
        expect(knight.valid_moves([0, 0])).to match_array([[2, 1], [1, 2]])
      end
    end
  end
end
