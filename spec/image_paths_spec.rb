require "spec_helper"

describe ImagePaths do
  it "has a version number" do
    expect(ImagePaths::VERSION).not_to be nil
  end
end

require './lib/image_paths'

RSpec.describe ImagePaths do
  describe 'image_paths correctly found and respond to method' do
    let(:page_path) { 'https://moikrug.ru/vacancies/1000031431' }

    context 'correctness of image_paths - create instance and read from given page' do
      # let(:image_paths_arr) { ImagePaths::ImagePaths.image_paths(page_path) }
      let(:image_paths_arr) { ImagePaths.image_paths(page_path) }
      describe 'check image_paths_arr' do
        it 'check image_paths_arr length' do
          expect(image_paths_arr.length).to eq(5)
        end
      end
      describe 'check image_paths_arr' do
        it 'check image_paths_arr content' do
          expect(image_paths_arr[3]).to eq('https://mc.yandex.ru/watch/38498795')
        end
      end
    end
  end
end