# This is a good start to lead your development
# I would suggest somewhere in your test you are making sure that the data you are expecting is on the page
# poem = PoetryService.get_poems_by_author("Emily", 1)
# expect(page).to have_content(poem.title) etc.

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
