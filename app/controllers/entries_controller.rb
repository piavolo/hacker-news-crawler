require 'nokogiri'
require 'open-uri'

class EntriesController < ApplicationController
  def index
    url = 'https://news.ycombinator.com/'
    document = Nokogiri::HTML(URI.open(url))

    @entries = []

    document.css('.athing').first(30).each do |athing|
      number = athing.css('.rank').text.to_i
      title = athing.css('.titleline a').text
      subtext = athing.next_element.css('.subtext')
      points = subtext.css('.score').text.to_i
      comments = subtext.css('a').last.text.split.first.to_i

      entry = Entry.find_or_initialize_by(number: number)
      entry.update(title: title, points: points, comments: comments)
      @entries << entry
    end
  end
end
