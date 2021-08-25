class Converter
  def initialize(line:)
    @words = build_words_array(line: line)
  end

  attr_reader :words

  def execute
    result = ''
    words.each do |word|
      if word.length <= 3
        result.concat(' ', word)
        next
      end

      shuffled_chars = word[1..-2].chars.shuffle.join
      result.concat(' ', word[0], shuffled_chars, word[-1])
    end

    return result
  end

  private

  def build_words_array(line:)
    line.split(' ')
  end
end

# こんな もじれつが くることを きたいして います
result = Converter.new(line: ARGV[0]).execute
puts result
