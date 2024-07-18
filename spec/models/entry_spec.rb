require 'rails_helper'

RSpec.describe Entry, type: :model do
  describe 'scopes' do
    before do
      create(:entry, title: 'Short title', comments: 5, points: 10)
      create(:entry, title: 'This is a longer title for testing', comments: 10, points: 5)
      create(:entry, title: 'Another short title', comments: 0, points: 15)
      create(:entry, title: 'A very long title indeed with many words', comments: 15, points: 0)
    end

    describe '.more_than_five_words' do
      it 'returns entries with titles longer than five words' do
        expect(Entry.more_than_five_words.count).to eq(2)
      end
    end

    describe '.five_or_less_words' do
      it 'returns entries with titles of five or fewer words' do
        expect(Entry.five_or_less_words.count).to eq(2)
      end
    end

    describe '.ordered_by_comments' do
      it 'returns entries ordered by comments in descending order' do
        expect(Entry.ordered_by_comments.first.comments).to be >= Entry.ordered_by_comments.second.comments
      end
    end

    describe '.ordered_by_points' do
      it 'returns entries ordered by points in descending order' do
        expect(Entry.ordered_by_points.first.points).to be >= Entry.ordered_by_points.second.points
      end
    end
  end
end
