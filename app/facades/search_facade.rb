class SearchFacade
  def initialize(author)
    @author = author
    @poem_service = PoetryService.new
    @tone_service = ToneService.new
  end

  def poems
    poem_results = @poem_service.get_poems_by_author(@author)
    poem_results.map! do |poem|
      Poem.new(poem)
    end
    poem_results.each do |poem|
      poem.tone = @tone_service.get_tone(poem.text)
    end
  end
  # call poetry service to get results
  # turn it into poem objects
  # pass the lines to the tone service for each poem
  # add tone result to poem object
end
