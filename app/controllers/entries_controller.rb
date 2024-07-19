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

    respond_to do |format|
      format.html
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace("entries_table", partial: "entries/table", locals: { entries: @entries })
      end
    end
  end
end
