require 'open-uri'

module EntriesScraperHelper
  def scrape_entries_from_hacker_news
    url = 'https://news.ycombinator.com/'
    document = Nokogiri::HTML(URI.open(url))
    entries_data = []

    document.css('.athing').first(30).each do |athing|
      entries_data << extract_entry_data(athing)
    end

    entries_data
  end

  private

  def extract_entry_data(athing)
    number = athing.css('.rank').text.to_i
    title = athing.css('.titleline a').text
    subtext = athing.next_element.css('.subtext')
    points = subtext.css('.score').text.to_i
    comments = subtext.css('a').last.text.split.first.to_i

    { number: number, title: title, points: points, comments: comments }
  end
end
