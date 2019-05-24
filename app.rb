# Aetherspeak lexicon
Lexicon = {
    "particles" => ["a", "anu", "e", "en", "kin", "la", "li", "mu", "nanpa", "o", "pi", "seme", "taso"],
    "verbs" => ["akesi", "alasa", "ali", "apeja", "esun", "ijo", "ilo", "insa", "jan", "jo", "kala", "kalama", "kasi", "kepeken", "kili", "kiwen", "ko", "kon", "kulupu", "kute", "lawa", "leko", "len", "linja", "lipu", "lon", "luka", "lupa", "ma", "mama", "mani", "meli", "mi", "mije", "moku", "monsi", "monsuta", "mun", "mute", "nanpa", "nasin", "nena", "nimi", "noka", "oko", "olin", "ona", "open", "pali", "palisa", "pan", "pana", "pata", "pilin", "pipi", "poka", "poki", "selo", "sewi", "sijelo", "sike", "sinpin", "sitelen", "sona", "soweli", "suno", "supa", "tawa", "telo", "tenpo", "toki", "tomo", "unpa", "uta", "utala", "waso"],
    "nouns" => ["akesi", "ala", "alasa", "ali", "anpa", "ante", "apeja", "awen", "esun", "ijo", "ike", "ilo", "insa", "jaki", "jan", "jelo", "jo", "kala", "kalama", "kama", "kapesi", "kasi", "ken", "kili", "kipisi", "kiwen", "ko", "kon", "kule", "kulupu", "kute", "lape", "laso", "lawa", "leko", "len", "lete", "lili", "linja", "lipu", "loje", "luka", "lupa", "ma", "majuna", "mama", "mani", "meli", "mi", "mije", "moku", "moli", "monsi", "monsuta", "mun", "musi", "mute", "namako", "nanpa", "nasa", "nasin", "nena", "ni", "nimi", "noka", "oko", "olin", "ona", "open", "pakala", "pali", "palisa", "pan", "pana", "pata", "pilin", "pimeja", "pini", "pipi", "poka", "poki", "pona", "powe", "pu", "sama", "seli", "selo", "sewi", "sijelo", "sike", "sinpin", "sitelen", "sona", "soweli", "suli", "suno", "supa", "suwi", "tan", "taso", "tawa", "telo", "tenpo", "toki", "tomo", "tu", "unpa", "uta", "utala", "walo", "wan", "waso", "wawa", "weka"],
    "adjectives" => ["akesi", "ala", "alasa", "ali", "anpa", "ante", "apeja", "awen", "esun", "ijo", "ike", "ilo", "insa", "jaki", "jan", "jelo", "jo", "kala", "kalama", "kama", "kapesi", "kasi", "ken", "kili", "kipisi", "kiwen", "ko", "kon", "kule", "kulupu", "kute", "lape", "laso", "lawa", "leko", "len", "lete", "lili", "linja", "lipu", "loje", "luka", "lupa", "ma", "majuna", "mama", "mani", "meli", "mi", "mije", "moku", "moli", "monsi", "monsuta", "mun", "musi", "mute", "namako", "nanpa", "nasa", "nasin", "nena", "ni", "nimi", "noka", "oko", "olin", "ona", "open", "pakala", "pali", "palisa", "pan", "pana", "pata", "pilin", "pimeja", "pini", "pipi", "poka", "poki", "pona", "powe", "pu", "sama", "seli", "selo", "sewi", "sijelo", "sike", "sinpin", "sitelen", "sona", "soweli", "suli", "suno", "supa", "suwi", "taso", "tawa", "telo", "tenpo", "toki", "tomo", "tu", "unpa", "uta", "utala", "walo", "wan", "waso", "wawa", "weka"],
    "pre-verbs" => ["oko", "sona", "awen", "kama", "ken", "wile"],
    "numbers" => ["ali", "luka", "wan", "tu", "mute"],
    "prepositions" => ["tawa", "sama", "tan", "kepeken", "lon"]
}

# Import context-free grammar rules
# load 'rules_1.rb'
load 'rules_2.rb'

# Define context-free grammar start
Start = :spell

# Production function
def produce from_variable
    # Initialize output
    to_str = []

    # Process symbol
    if from_variable.is_a?(Symbol)
        # Choose random rule
        if !Rules.key?(from_variable)
            raise "Rule #{from_variable.to_s} not found!"
        end
        rule = [Rules[from_variable].sample].flatten
        
        # Produce from rule
        variables = rule.map { |variable| produce(variable) }

        # Push to output
        to_str.push variables
    elsif from_variable.is_a?(String)
        # Push strings to output
        to_str.push from_variable
    end

    # Output
    to_str.flatten
end

# Parameters
num_spells = 100

# Execution logic
for i in 1..num_spells
    # Join terminals
    terminals = produce(Start).join(" ");

    # Remove spaces before punctuation
    terminals_formatted = terminals.gsub(/\s[.:!]/) { |terminal| terminal.strip }

    # Print output
    print "#{i} " + terminals_formatted + "\n"
end