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
      tone_response = @tone_service.get_tone(poem.text)
      poem.tone = tone_names(tone_response)
    end
  end

  def tone_names(tone_results)
    tone_results[:document_tone][:tones].map do |tone|
      tone[:tone_name]
    end
  end
end
