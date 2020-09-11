# This service looks great!
# I like that you have the limit as a default parameter, and it could be easily adjusted.

class PoetryService
  def get_poems_by_author(author, limit = 10)
    response = conn.get("/author/#{author}")
    JSON.parse(response.body, symbolize_names: true).first(limit)
  end

  private

  def conn
    Faraday.new(url: 'https://poetrydb.org/')
  end
end
