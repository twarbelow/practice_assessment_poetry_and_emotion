class Poem
  attr_accessor :title, :author, :tone
  def initialize(info)
    @title = info[:title]
    @author = info[:author]
    @lines = info[:lines]
  end

  def text
    @lines.join(" / ")
  end
end
