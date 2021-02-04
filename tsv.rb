# frozen_string_literal: true

require 'csv'

headers = %w[json]
json = '{"a": 1}'

CSV.open('embulk/data.tsv', 'w', write_headers: true, headers: headers, col_sep: "\t") do |tsv|
  1_000_000.times do
    tsv << [json]
  end
end

puts 'fin.'
