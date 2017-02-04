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
    unless page_path =~ /\A#{URI.regexp(['http', 'https'])}\z/
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
      puts 'HTTParty::Error: bad response. HTTParty::Error '
      return false
    rescue StandardError
      puts 'StandardError: bad response'
      return false
    end
    true
  end

  def self.collect_paths(page_path)
    links = []
    Nokogiri::HTML(open(page_path)).css('img').select {
      |link| links << link.attr('src')
    }
    links
  end
end


# a = ImagePaths.at('http://twitter.com/statuses/public_timeline.json')
# 404 Not Found
# StandardError:: response.code = 404

# main answer
# a = ImagePaths.at("https://moikrug.ru/vacancies/1000031431")
#ok response.code = 200

# a = ImagePaths.at('http://brainlook.org')
# Ok response.code = 200

# a = ImagePaths.at("https://github.com/nslocum/design-patterns-in-ruby")
#ok response.code = 200

# a = ImagePaths.at('https://github.com/BlookHo/image_paths_gem')
# Ok response.code = 200

# a = ImagePaths.at('https://127.0.0.1/send_bitcoins')
# "StandardError: bad response."

# a = ImagePaths.at('http:/../../../../../etc/passwd')
# "StandardError: bad response."
# StandardError:: undefined method `code' for nil:NilClass !!!


# a = ImagePaths.at('chrome-extension://klbibkeccnjlkjkiokjodocebajanakg/suspended.html#uri=https://sourcemaking.com/design_patterns/template_method')
# "Error: bad url"

# a = ImagePaths.at('http://||=')
# "Error: bad url"

# a = ImagePaths.at(khbkjb)
# undefined local variable or method `khbkjb'  (NameError)






# puts a.inspect

# puts "\n"
# puts a #.inspect# if a==[]
# p a if a==[]


# TODO: RSpec: errors  + make diff-t urls (Faker)
