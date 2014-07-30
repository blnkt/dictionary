class Term
  @@all_terms = {}
  @@all_words = []
  def initialize(word, definition)
    @word = word
    @definition = definition
    @@all_terms[@word] = @definition
  end

  def word
    @word
  end

  def define
    @definition
  end

  def Term.definition(word)
    @@all_terms.values_at(word)
  end

  def Term.all_terms
    @@all_terms
  end

  def Term.all_words
    @@all_words = @@all_terms.keys
  end

  def edit(new_definition)
    @definition = new_definition
  end

  def delete_term
    @@all_terms.delete(@word)
    @@all_words.delete(@word)
  end


end
