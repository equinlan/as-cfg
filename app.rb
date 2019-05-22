Lexicon = {
    "particles" => ["a", "anu", "e", "en", "kin", "la", "li", "mu", "nanpa", "o", "pi", "seme", "taso"],
    "verbs" => ["akesi", "alasa", "ali", "apeja", "esun", "ijo", "ilo", "insa", "jan", "jo", "kala", "kalama", "kasi", "kepeken", "kili", "kiwen", "ko", "kon", "kulupu", "kute", "lawa", "leko", "len", "linja", "lipu", "lon", "luka", "lupa", "ma", "mama", "mani", "meli", "mi", "mije", "moku", "monsi", "monsuta", "mun", "mute", "nanpa", "nasin", "nena", "nimi", "noka", "oko", "olin", "ona", "open", "pali", "palisa", "pan", "pana", "pata", "pilin", "pipi", "poka", "poki", "selo", "sewi", "sijelo", "sike", "sinpin", "sitelen", "sona", "soweli", "suno", "supa", "tawa", "telo", "tenpo", "toki", "tomo", "unpa", "uta", "utala", "waso"],
    "nouns" => ["akesi", "ala", "alasa", "ali", "anpa", "ante", "apeja", "awen", "esun", "ijo", "ike", "ilo", "insa", "jaki", "jan", "jelo", "jo", "kala", "kalama", "kama", "kapesi", "kasi", "ken", "kili", "kipisi", "kiwen", "ko", "kon", "kule", "kulupu", "kute", "lape", "laso", "lawa", "leko", "len", "lete", "lili", "linja", "lipu", "loje", "luka", "lupa", "ma", "majuna", "mama", "mani", "meli", "mi", "mije", "moku", "moli", "monsi", "monsuta", "mun", "musi", "mute", "namako", "nanpa", "nasa", "nasin", "nena", "ni", "nimi", "noka", "oko", "olin", "ona", "open", "pakala", "pali", "palisa", "pan", "pana", "pata", "pilin", "pimeja", "pini", "pipi", "poka", "poki", "pona", "powe", "pu", "sama", "seli", "selo", "sewi", "sijelo", "sike", "sinpin", "sitelen", "sona", "soweli", "suli", "suno", "supa", "suwi", "tan", "taso", "tawa", "telo", "tenpo", "toki", "tomo", "tu", "unpa", "uta", "utala", "walo", "wan", "waso", "wawa", "weka"],
    "adjectives" => ["akesi", "ala", "alasa", "ali", "anpa", "ante", "apeja", "awen", "esun", "ijo", "ike", "ilo", "insa", "jaki", "jan", "jelo", "jo", "kala", "kalama", "kama", "kapesi", "kasi", "ken", "kili", "kipisi", "kiwen", "ko", "kon", "kule", "kulupu", "kute", "lape", "laso", "lawa", "leko", "len", "lete", "lili", "linja", "lipu", "loje", "luka", "lupa", "ma", "majuna", "mama", "mani", "meli", "mi", "mije", "moku", "moli", "monsi", "monsuta", "mun", "musi", "mute", "namako", "nanpa", "nasa", "nasin", "nena", "ni", "nimi", "noka", "oko", "olin", "ona", "open", "pakala", "pali", "palisa", "pan", "pana", "pata", "pilin", "pimeja", "pini", "pipi", "poka", "poki", "pona", "powe", "pu", "sama", "seli", "selo", "sewi", "sijelo", "sike", "sinpin", "sitelen", "sona", "soweli", "suli", "suno", "supa", "suwi", "taso", "tawa", "telo", "tenpo", "toki", "tomo", "tu", "unpa", "uta", "utala", "walo", "wan", "waso", "wawa", "weka"],
    "pre_verbs" => ["oko", "sona", "awen", "kama", "ken", "wile"],
    "numbers" => ["ali", "luka", "wan", "tu", "mute"],
    "prepositions" => ["tawa", "sama", "tan", "kepeken", "lon"]
}

Variables = [:adjective, :adjectives, :but, :fives, :hundreds, :of, :noun, :noun_except_i, :ones, :ordinal, :pre_verb, :precondition, :predicate, :preposition, :prepositional, :sentence, :sentences, :separator, :spell, :still, :subject, :subjects, :time, :twenties, :twos, :verb, :direct_object, :word, :words, :yield]
Terminals = [Lexicon.values.flatten.uniq, "!", ".", ":"]
Rules = {
    adjective: Lexicon["adjectives"],
    adjectives: [nil, [:adjective, :of, :adjectives, :ordinal]],
    but: [nil, "taso"],
    fives: [nil, "luka", ["luka", "luka"], ["luka", "luka", "luka"]],
    hundreds: [nil, "ali", [:hundreds, "ali"]],
    of: [nil, ["pi", :noun]],
    noun: Lexicon["nouns"],
    noun_except_i: Lexicon["nouns"].reject { |noun| noun == "mi" },
    ones: [nil, "wan"],
    ordinal: [nil, ["nanpa", :hundreds, :twenties, :fives, :twos, :ones]],
    pre_verb: [nil, Lexicon["pre_verbs"]].flatten,
    precondition: [nil, [:time, "la"], [:subject, :predicate, "la"], ["ken", "la"]],
    predicate: [[:of, :adjectives], [:preposition, :noun, :adjectives], [:noun, :adjectives, :prepositional], [:pre_verb, :verb, :adjectives, :direct_object, :prepositional]],
    preposition: Lexicon["prepositions"],
    prepositional: [nil, [:preposition, :noun, :adjectives]],
    sentence: [[:but, :precondition, :subject, :predicate, :still, "."]],
    sentences: [:sentence, [:sentence, :sentences]],
    separator: ["en", "anu"],
    spell: [["kon", "o", :predicate, :yield, "a", "!"], ["kon", "o", :verb, "e", "ni", ":", :sentences, :yield, "a", "!"]],
    still: [nil, "kin"],
    subject: ["mi", ["mi", :adjectives, :ordinal, "li"], [:noun_except_i, :adjectives, :ordinal, "li"]],
    subjects: [:subject, [:subject, :separator, :subject]],
    time: [["tenpo", :adjectives, :prepositional]],
    twenties: [nil, "mute", ["mute", "mute"], ["mute", "mute", "mute"], ["mute", "mute", "mute", "mute"]],
    twos: [nil, "tu", ["tu", "tu"]],
    verb: Lexicon["verbs"],
    direct_object: [nil, ["e", :noun, :adjectives]],
    word: Lexicon.values.flatten.uniq,
    words: [nil, [:word, :words]],
    yield: [nil, ["mu", :words]]
}
Start = :spell