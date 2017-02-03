# require 'json'

require "image_paths/version"
require 'nokogiri'
require 'open-uri'
require 'uri'
require 'httparty'

class ImagePaths
  def self.image_paths(page_path)
    return collect_links(page_path) if (url_correct?(page_path) && page_response_ok?(page_path))
    []
  end

  def self.url_correct?(page_path)
    unless page_path =~ /\A#{URI::regexp(['http', 'https'])}\z/
      p "Error: bad url"
      return false
    end
    # p "url_correct"
    true
  end

  # response.body, response.code, response.message, response.headers.inspect
  def self.page_response_ok?(page_path)
    begin
      response = HTTParty.get(page_path)
      unless response.code.to_i < 400
        puts "Error: bad response: response.code = #{response.code} "#.inspect
        return false
      end
    rescue HTTParty::Error
      puts 'Error: bad response. HTTParty::Error '#, response.code
      return false
        # don´t do anything / whatever
    rescue StandardError
      p 'StandardError: bad response.'#, response.code
      return false
    end
    # p "page response ok"
    true
    # response = HTTParty.get(page_path)
    # response.each do |item|
    #   puts item#['user']['screen_name']
    # end
  end

  def self.collect_links(page_path)  #, :allow_redirections => :all
    links = []
    # page = Nokogiri::HTML(open(page_path))
    Nokogiri::HTML(open(page_path)).css('img').select{ |link| links << link.attr('src') }
    # puts "links = ", links
    links
  end

end

# a = ImagePaths.image_paths('http://twitter.com/statuses/public_timeline.json')
# 404 Not Found

# a = ImagePaths.image_paths("https://moikrug.ru/vacancies/1000031431")
#ok

# a = ImagePaths.image_paths("https://github.com/nslocum/design-patterns-in-ruby")
#ok

# a = ImagePaths.image_paths('https://127.0.0.1/send_bitcoins')
# uncorrect url

# a = ImagePaths.image_paths('http:/../../../../../etc/passwd')
# uncorrect url

a = ImagePaths.image_paths('chrome-extension://klbibkeccnjlkjkiokjodocebajanakg/suspended.html#uri=https://sourcemaking.com/design_patterns/template_method')
# uncorrect url





# puts a.inspect
puts "\n"
puts a #.inspect# if a==[]
p a if a==[]


# TODO:: RSpec: errors  + make diff-t urls (Faker)
