require 'pry'
# require 'colorize'
class CommandLineInterfaceModel


  def greet
    puts "Welcome to the HasManyMedia database, the command line solution for your Movie, Actor and character finding needs! Can't remember what movie that character is from? Want to prove to your friends that you were totally right about what movie THAT actor was in? Did that actor REALLY play that character? Find out here!"
  end


  def gets_user_input
    puts "Please enter the name of an actor, character, or movie. Names are case sensitive. For instance, type Leonardo DiCaprio with appropriate capital letters :)"
    #what could we put here to allow a user to type a response?
    input = gets.chomp
  end


  def find_actor(name)
    actor = Actor.find_by(name: name)
     if actor == nil
       try_again
     else
       puts "#{name} is in our database! Would you like to see a list of #{name}'s movies?"
       gets_user_input_movies(actor)
     end
      #binding.pry
  end


  def find_movies(title)
    movie = Movie.find_by(title: title)
    if movie == nil
      try_again
    else
      puts "#{movie.title} is in our database! Would you like to see a cast list for #{movie.title}?"
      get_cast_list_from_movie(movie)
    end
  end


  def find_characters(name)
  character = Character.find_by(name: name)
    if character == nil
      try_again
    else
      puts "#{character.name} is in our database! Would you like to see which actor played #{character.name}?"
      gets_user_input_actors_from_characters(character)
    end
  end


  def gets_user_input_actors_from_characters(character)
   puts "Please enter yes or no:"
   charac_input = gets.chomp.downcase
   if charac_input == "yes"
     puts "Here is who played that role:"
     print_actor_from_character(character)
     puts "Would you like to see the movie for this character?"
     print_movies_from_character(character)
   elsif charac_input == "no"
     puts "Ok. Anything else we can help you with?"
     exit_or_continue
   else
     gets_user_input_actors_from_characters(character)
     # puts find_movies(self)
   end
 end


 def gets_user_input_movies(actor)
    puts "Please enter yes or no:"
    movie_input = gets.chomp.downcase
    if movie_input == "yes"
      puts "Here's a list of #{actor.name}'s movies: "
      print_all_movies_from_actor(actor)
      puts "Would you like to see a list of #{actor.name}'s characters?"
      gets_user_input_characters(actor)
    elsif movie_input == "no"
      puts "Ok. Anything else we can help you with?"
      exit_or_continue
    else
      gets_user_input_movies(actor)
    end
  end

  def get_cast_list_from_movie(movie)
    puts "Please enter yes or no:"
    cast_input = gets.chomp.downcase
    if cast_input == "yes"
      puts "Here's the cast list for #{movie}: "
      print_all_characters_from_movie(movie)
      puts "Would you like to see the actors for this movie?"
      gets_actors_for_movie(movie)
      # gets_user_input_characters(actor)
    elsif cast_input == "no"
      puts "Ok. Anything else we can help you with?"
      exit_or_continue
    else
      get_cast_list_from_movie(movie)
      # puts find_movies(self)
    end
  end

  def print_movies_from_character(character)
    input = gets.chomp.downcase
    if input == "yes"
      puts character.movie.title
      puts "Awesome! Anything else we can help you with?"
      exit_or_continue
    elsif input == "no"
      puts "Ok. Anything else we can help you with?"
      exit_or_continue
    else
      print_movies_from_character(character)
    end
  end

  def print_actor_from_character(character)
    puts character.actor.name
  end

  def print_all_characters_from_movie(movie)
    movie.characters.each do |character|
      puts character.name
    end
    # binding.pry
  end

  def print_all_movies_from_actor(actor)
    actor.movies.each do |movie|
      puts movie.title
    end
  end

  def print_all_actors_from_movie(movie)
    movie.actors.each do |actor|
      puts actor.name
    end
  end



  # def find_all

  def gets_actors_for_movie(movie)
    puts "Please enter yes or no:"
    character_input = gets.chomp.downcase
    if character_input == "yes"
      puts "Here's a list of actors for #{movie.title}: "
      find_all_actors_from_movie(movie)
    elsif character_input == "no"
      puts "Ok. Anything else we can help you with?"
      exit_or_continue
    else
      gets_actors_for_movie(movie)
      # puts find_movies(self)
    end
  end


  def gets_user_input_characters(actor)
    puts "Please enter yes or no:"
    character_input = gets.chomp.downcase
    if character_input == "yes"
      puts "Here's a list of #{actor.name}'s characters: "
      find_all_characters_from_actor(actor)
    elsif character_input == "no"
      puts "Ok. Anything else we can help you with?"
      exit_or_continue
    else
      gets_user_input_characters(actor)
      # puts find_movies(self)
    end
  end

  def find_all_actors_from_movie(movie)
    movie.actors.each do |actor|
      puts actor.name
    end
    puts "Awesome! Anything else we can help you with?"
    exit_or_continue
  end

  def find_all_characters_from_actor(actor)
    actor.characters.each do |character|
      puts character.name
    end
    puts "Awesome! Anything else we can help you with?"
    exit_or_continue
  end

  def exit_or_continue
    puts "Please enter yes or no:"
    user_input = gets.chomp.downcase
    if user_input == "yes"
      run
    elsif user_input == "no"
      puts "We're sorry to see you go. Thank you for using the HasManyMedia database for your media query needs!"
    else
      exit_or_continue
    end
  end

  def try_again
    puts "That information is not in our database. Please check spelling or "
    name = gets_user_input
    find_actor(name)
  end

  def run
    greet
    input = gets_user_input
    movie = Movie.find_by(title: input)
    character = Character.find_by(name: input)
    actor = Actor.find_by(name: input)
    if actor!= nil
      find_actor(input)
    elsif movie!= nil
      find_movies(input)
    elsif character != nil
      find_characters(input)
    else
      try_again
    end
  end
end
