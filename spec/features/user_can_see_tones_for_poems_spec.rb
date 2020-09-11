require 'rails_helper'

RSpec.describe 'user can search for poems' do
  it 'and see results with tone, title, author, and poem' do
    visit '/'
    fill_in "author", with: "Emily"
    click_button "Get Poems"
    expect(current_path).to eq("/search")
    expect(page).to have_css(".poem-results", count: 10)
    within('.poem-results') do
      expect(page).to have_content("Tone: ")
      expect(page).to have_content("Title: ")
      expect(page).to have_content("Author: ")
      expect(page).to have_content("Poem: ")
    end
  end
end
