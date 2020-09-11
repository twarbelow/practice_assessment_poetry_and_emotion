# Good job joining the lines together into a single string.
# In the initialize method I would include an attribute of tone and set it to be empty, just to make it a little clearer that it is an attribute of a poem

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
