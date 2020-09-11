class SearchController < ApplicationController
  def index
    author = params[:author]
    search = SearchFacade.new(author)
    @poems = search.poems
  end
end
