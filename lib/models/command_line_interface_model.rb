require 'pry'
class CommandLineInterfaceModel

  def greet
    puts "Welcome to the MovieActorCharacter Database, the command line solution for your Movie, Actor and character finding needs! Can't remember what movie that character is from? Want to prove to your friends that you were totally right about what movie THAT actor was in? Did that actor REALLY play that character? Find out here!"
  end

  def gets_user_input
    puts "Please enter the name of an Actor, character, or movie:"
    #what could we put here to allow a user to type a response?
    input = gets.chomp
  end

  # def search(term, first_name, last_name, name, title)
  #   if Actor.all.include?(term)
  #     find_actor(first_name, last_name)
  #   elsif Movie.all.include?(title)
  #     find_movie(title)
  #   elsif Character.all.include?(name)
  #     find_character(name)
  #   else
  #     gets_user_input
  #   end
  # end

  def find_actor(name)
    actor = Actor.find_by(name: name)
     if actor == nil
       try_again_actor
     else
       puts "#{name} is in our database! Would you like to see a list of #{name}'s movies?"
       gets_user_input_movies(actor)
     end
      #binding.pry
  end

  def find_movies(title)
    movie = Movie.find_by(title: title)
    if movie == nil
      try_again_movie
    elsif
      puts movie.title
  end
end

def find_characters (name)
  character = Character.find_by(name: name)
  if character == nil
    try_again_character
  elsif
    puts character.name
  end
end

  def try_again_character
    puts "That movie is not in our database. Please check spelling or "
    input = gets_user_input
    find_characters(input)
  end

  def try_again_movie
    puts "That movie is not in our database. Please check spelling or "
    input = gets_user_input
    find_movies(input)
  end

  def try_again_actor
    puts "That actor is not in our database. Please check spelling or "
    name = gets_user_input
    find_actor(name)
  end

  def gets_user_input_movies(actor)
    puts "Please Enter Yes or No:"
    movie_input = gets.chomp
    if movie_input == "Yes"
      puts "Here's a list of #{actor.name}'s movies: "
      find_all_movies_from_actor(actor)
      puts "Would you like to see a list of #{actor.name}' characters?"
      gets_user_input_characters(actor)
    elsif movie_input == "No"
      puts "Ok. Anything else we can help you with?"
      exit_or_continue
    else
      gets_user_input_movies(actor)
      # puts find_movies(self)
    end
  end

  def find_all_movies_from_actor(actor)
    actor.movies.each do |movie|
      puts movie.title
    end
  end


  def gets_user_input_characters(actor)
    puts "Please Enter Yes or No:"
    character_input = gets.chomp
    if character_input == "Yes"
      puts "Here's a list of #{actor.name}'s characters: "
      find_all_characters_from_actor(actor)
    elsif character_input == "No"
      puts "Ok. Anything else we can help you with?"
      exit_or_continue
    else
      gets_user_input_characters(actor)
      # puts find_movies(self)
    end
  end

  def find_all_characters_from_actor(actor)
    actor.characters.each do |character|
      puts character.name
    end
    puts "Awesome. Anything else we can help you with?"
    exit_or_continue
  end

  def exit_or_continue
    puts "Please Enter Yes or No:"
    user_input = gets.chomp
    if user_input == "Yes"
      run
    elsif user_input == "No"
      puts "Thanks for using the MovieActorCharacter database. Take care!"
    else
      exit_or_continue
    end
  end

  def run
    greet
    # input = gets_user_input.split(" ")
    # find_actor(input[0], input[1])
    input = gets_user_input
    find_actor(input)
    # search(term, first_name, last_name, name, title)
  end

end
