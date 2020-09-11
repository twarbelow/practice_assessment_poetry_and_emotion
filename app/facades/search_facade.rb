
class SearchFacade
  def initialize(author)
    @author = author
    @poem_service = PoetryService.new
    @tone_service = ToneService.new
  end

# Great job collecting the information and creating an obj here
# I would likely break this method up into some helper methods but only if you had time for that refactor
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

# Join the tones here as a single string rather than in the view
  def tone_names(tone_results)
    tone_results[:document_tone][:tones].map do |tone|
      tone[:tone_name]
    end
  end
end
