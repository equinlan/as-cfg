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
    predicate: [["pi", :noun, :adjectives], [:preposition, :noun, :adjectives], [:noun, :adjectives, :prepositional], [:pre_verb, :verb, :adjectives, :direct_object, :prepositional]],
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