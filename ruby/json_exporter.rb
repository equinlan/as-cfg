require './rules_2'
require './app'
require 'json'

File.open("../json/rules.json", "w") do |f|
    f.write(Rules.to_json)
end