require 'nokogiri'
require 'open-uri'

class EntriesController < ApplicationController
  def index
    url = 'https://news.ycombinator.com/'
    document = Nokogiri::HTML(URI.open(url))

    entries_data = []

    document.css('.athing').first(30).each do |athing|
      number = athing.css('.rank').text.to_i
      title = athing.css('.titleline a').text
      subtext = athing.next_element.css('.subtext')
      points = subtext.css('.score').text.to_i
      comments = subtext.css('a').last.text.split.first.to_i

      entries_data << { number: number, title: title, points: points, comments: comments }
    end

    entries_data.first(30).each do |entry_data|
      entry = Entry.find_or_initialize_by(number: entry_data[:number])
      entry.update(title: entry_data[:title], points: entry_data[:points], comments: entry_data[:comments])
    end

    @entries = Entry.limit(30)

    if params[:filter].present?
      case params[:filter]
      when 'more_than_five_words'
        @entries = @entries.more_than_five_words.ordered_by_comments
      when 'five_or_less_words'
        @entries = @entries.five_or_less_words.ordered_by_points
      end
    end
  end
end
