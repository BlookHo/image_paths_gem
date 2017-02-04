require 'spec_helper'

describe ImagePaths do
  it 'Gem has a version number' do
    expect(ImagePaths::VERSION).not_to be nil
  end
end

require './lib/image_paths'

RSpec.describe ImagePaths do

  describe 'Page path - uncorrect' do
    context 'check page_path - Error: bad uri' do
      let(:page_path) { 'http://||=' }
      let(:image_paths_arr) { ImagePaths.at(page_path) }
      it 'check image_paths_arr to []' do
        expect(image_paths_arr).to eq([])
      end
    end
    context 'check page_path - StandardError: bad response' do
      let(:page_path) { 'http:/../../../../../etc/passwd' }
      let(:image_paths_arr) { ImagePaths.at(page_path) }
      it 'check image_paths_arr to []' do
        expect(image_paths_arr).to eq([])
      end
    end
    context 'check page_path - Error: bad response: response.code = 404' do
      let(:page_path) { 'http://twitter.com/statuses/public_timeline.json' }
      let(:image_paths_arr) { ImagePaths.at(page_path) }
      it 'check image_paths_arr to []' do
        expect(image_paths_arr).to eq([])
      end
    end
  end

  describe 'Page path - correct. Page - found and respond to' do
    let(:page_path) { 'https://moikrug.ru/vacancies/1000031431' }

    context 'create instance and read from given page' do
      let(:image_paths_arr) { ImagePaths.at(page_path) }
      describe 'check image_paths_arr - Ok' do
        it 'check image_paths_arr length' do
          expect(image_paths_arr.length).to eq(5)
        end
      end
      describe 'check image_paths_arr - Ok' do
        it 'check image_paths_arr content' do
          expect(image_paths_arr[3]).to eq('https://mc.yandex.ru/watch/38498795')
        end
      end
    end
  end
end
