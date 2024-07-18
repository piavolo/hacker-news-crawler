class EntriesController < ApplicationController
  include EntriesScraperHelper
  include EntriesFilterHelper

  def index
    entries_data = scrape_entries_from_hacker_news

    entries_data.each do |entry_data|
      entry = Entry.find_or_initialize_by(number: entry_data[:number])
      entry.update(entry_data)
    end

    @entries = Entry.limit(30)

    @entries = filter_entries(@entries, params[:filter]) if params[:filter].present?
  end
end
