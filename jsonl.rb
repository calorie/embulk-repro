# frozen_string_literal: true

require 'json'

json = JSON.generate({ a: 1, b: { c: [{ d: 1 }] }, e: [{ f: 1 }] })

lines = [json] * 5_000_000

File.open('embulk/data.json', 'w') do |file|
  file.puts(lines.join("\n"))
end

puts 'fin.'
