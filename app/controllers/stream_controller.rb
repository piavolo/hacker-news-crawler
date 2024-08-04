class StreamController < ApplicationController
  include ActionController::Live

  def events
    response.headers['Content-Type'] = 'text/event-stream'
    begin
      loop do
        entries = fetch_entries
        data = format_entries(entries)
        Rails.logger.info "Sending latest entries"
        response.stream.write "data: #{data}\n\n"
        sleep 1
      end
    rescue IOError => e
      Rails.logger.info "Stream closed: #{e}"
    ensure
      response.stream.close
      Rails.logger.info "Stream closed"
    end
  end

  private

  def fetch_entries
    Entry.order(created_at: :asc).limit(30)
  end

  def format_entries(entries)
    entries.map do |entry|
      { number: entry.id, title: entry.title, points: entry.points, comments: entry.comments }
    end.to_json
  end
end
