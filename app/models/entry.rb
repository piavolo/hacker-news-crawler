class Entry < ApplicationRecord
  scope :more_than_five_words, -> { where("LENGTH(title) - LENGTH(REPLACE(title, ' ', '')) + 1 > 5") }
  scope :five_or_less_words, -> { where("LENGTH(title) - LENGTH(REPLACE(title, ' ', '')) + 1 <= 5") }
  scope :ordered_by_comments, -> { order(comments: :desc) }
  scope :ordered_by_points, -> { order(points: :desc) }
end
