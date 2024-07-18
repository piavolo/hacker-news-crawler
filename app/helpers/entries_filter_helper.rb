module EntriesFilterHelper
  def filter_entries(entries, filter)
    case filter
    when 'more_than_five_words'
      entries.more_than_five_words.ordered_by_comments
    when 'five_or_less_words'
      entries.five_or_less_words.ordered_by_points
    else
      entries
    end
  end
end
