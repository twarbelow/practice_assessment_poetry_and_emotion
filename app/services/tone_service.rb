# Great job making the url and api key dynamic
# Rather than including the params as part of the path break it into a block for better readability

class ToneService
  def get_tone(text)
    response = conn.get("/v3/tone?version=2017-09-21&text=#{text}")
    JSON.parse(response.body, symbolize_names: true)
  end

  private

  def conn
    Faraday.new(ENV['TONE_API_URL']) do |connection|
      connection.basic_auth("apikey", ENV['TONE_API_KEY'])
    end
  end
end
