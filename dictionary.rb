require "./lib/term"

def main_menu
  if Term.all_terms.length < 1
    add_new_term
  else
    puts "\nPress 'a' to add a new term.\nPress 'c' to display defined words.\nEnter a word to search for its definition.\nPress 'x' to exit the program.\n"
    input = gets.chomp
    if input == "x"
      exit
    elsif input == "a"
      add_new_term
    elsif input == "c"
      show_all_words
    elsif Term.definition(input) != [nil]
      puts "\n#{Term.definition(input)[0]}\n"
    end
  end
  main_menu
end

def add_new_term
  puts "\nEnter a new word to add it to the dictionary"
  new_word = gets.chomp
  puts "\nEnter a definition of the new word."
  new_definition = gets.chomp
  Term.new(new_word, new_definition)
end

def show_all_words
  Term.all_words.each do |word|
    puts "#{word}"
  end
  puts "\nEnter a word to investigate it.\nPress 'x' to return to the main menu.\n"
  @word_input = gets.chomp
  if @word_input == 'x'
    main_menu
  else
    term_manager
  end
end

def term_manager
  if Term.definition(@word_input) != [nil]
    puts "\n#{Term.definition(@word_input)[0]}\n"
    puts "\nPress 'e' to edit this definition.\nPress 'd' to delete this term entry.\nPress 'x' to return to the main menu.\n"
    manager_input = gets.chomp
    if manager_input == 'x'
      main_menu
    elsif manager_input == 'e'
      puts "Enter a new definition"
      new_def = gets.chomp
      @word_input.edit(new_def)
    elsif manager_input == 'd'
      Term.all_terms.delete(@word_input)
    end
  end
    show_all_words
end
main_menu
