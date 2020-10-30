class TextAnalyzer
  def process
    @text = IO.read('sample_text.txt')
    yield(@text)
  end
end

analyzer = TextAnalyzer.new
analyzer.process { |text| puts "#{text.split(/\n\n/).count} paragraphs" }
analyzer.process { |text| puts "#{text.lines.count} lines" }
analyzer.process { |text| puts "#{text.split.count} words" }
