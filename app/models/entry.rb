class Entry < ApplicationRecord
  scope :more_than_five_words, -> { where("LENGTH(title) - LENGTH(REPLACE(title, ' ', '')) + 1 > 5") }
  scope :five_or_less_words, -> { where("LENGTH(title) - LENGTH(REPLACE(title, ' ', '')) + 1 <= 5") }
  scope :ordered_by_comments, -> { order(comments: :desc) }
  scope :ordered_by_points, -> { order(points: :desc) }

  extend EntriesScraperHelper

  def self.update_entries_from_hacker_news
    include EntriesScraperHelper
    entries_data = scrape_entries_from_hacker_news

    entries_data.each do |entry_data|
      entry = find_or_initialize_by(number: entry_data[:number])
      entry.update(entry_data)
    end
  end
end
