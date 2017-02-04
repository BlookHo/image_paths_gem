require 'image_paths/version'
require 'nokogiri'
require 'open-uri'
require 'uri'
require 'httparty'

# Main gem class
class ImagePaths
  def self.at(page_path)
    begin
      return collect_paths(page_path) if path_correct?(page_path)
    rescue => e
      puts "StandardError: #{e}"
      return []
    end
    []
  end

  def self.path_correct?(page_path)
    uri_ok?(page_path) && response_ok?(page_path)
  end

  def self.uri_ok?(page_path)
    unless page_path =~ /\A#{URI.regexp(%w(http https))}\z/
      puts 'Error: bad uri'
      return false
    end
    true
  end

  # response.body, .code, .message, .headers.inspect
  def self.response_ok?(page_path)
    begin
      response = HTTParty.get(page_path)
      if response.code.to_i >= 400
        puts "Error: bad response: response.code = #{response.code}"
        return false
      end
    rescue HTTParty::Error
      puts 'HTTParty::Error: bad response. HTTParty::Error'
      return false
    rescue StandardError
      puts 'StandardError: bad response'
      return false
    end
    true
  end

  def self.collect_paths(page_path)
    links = []
    Nokogiri::HTML(open(page_path)).css('img').select { |link| links << link.attr('src') }
    links
  end
end
