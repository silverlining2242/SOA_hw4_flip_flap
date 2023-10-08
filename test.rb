# frozen_string_literal: true
# Module that can be included (mixin) to take and output TSV data

module TsvBuddy
  # Converts a String with TSV data into internal data structure @data
  # arguments: tsv - a String in TSV format
  # returns: nothing
  TAB = "\t"
  NEWLINE = "\n"



  def take_tsv(tsv)
    @data = []
    rows = tsv.split(NEWLINE).map { |line| line.split(TAB) }
    headers = rows.first
    data_rows = rows[1..]
    @data = data_rows.map do |row| 
      row.map.with_index { |cell, i| [headers[i], cell] }.to_h
    end
    # @data =  key_values
    # binding.pry
    # puts @data
  end

  # Converts @data into tsv string
  # arguments: none
  # returns: String in TSV format

  def to_tsv
      keys = @data[0].keys
      data1 = keys.join(TAB) + NEWLINE
      data2 = @data.map {|item| item.values.join(TAB) + NEWLINE}
      data2_string = data2.join
      tsv = data1+data2_string

  end
end




  
#   class Tester
#   include TsvBuddy
#   end
#   test = Tester.new
#   test.take_tsv(File.read('data/survey.tsv'))

# t = Tester.new.take_tsv(File.read('tsvoutput.tsv'))