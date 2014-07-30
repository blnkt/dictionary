require "rspec"
require "term"
require "./dictionary"

describe Term do
  it "ititializes with a word and its definition" do
    new_term = Term.new("kitten", "cute")
    expect(new_term).to be_an_instance_of Term
  end

  it "looks at the word" do
    new_term = Term.new("kitten", "cute")
    new_term.word
    expect(new_term.word).to eq ("kitten")
  end

  it "lists all the words" do
    dog = Term.new("dog", "sad")
    cat = Term.new("kitten", "cute")
    frog = Term.new("froggy", "green")
    expect(Term.all_words).to eq (["kitten", "dog", "froggy"])
  end

  it "shows the definition of a given word" do
    new_term = Term.new("dog", "sad")
    cat = Term.new("kitten", "cute")
    frog = Term.new("froggy", "soft")
    expect(Term.definition("dog")).to eq (["sad"])
  end

  it "edit the definition of a word" do
    new_term = Term.new("dog", "sad")
    cat = Term.new("kitten", "cute")
    frog = Term.new("froggy", "green")
    new_term.edit("happy")
    expect(new_term.define).to eq ("happy")
  end

  it "delete the term" do
    new_term = Term.new("dog", "sad")
    cat = Term.new("kitten", "cute")
    frog = Term.new("froggy", "green")
    cat.delete_term
    frog.delete_term
    expect(Term.all_terms.length).to eq (1)
  end
end
