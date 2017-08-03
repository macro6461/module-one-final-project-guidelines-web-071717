require 'pry'
# require 'colorize'
class CommandLineInterfaceModel


  def greet
    puts "
                  ██╗  ██╗ █████╗ ███████╗███╗   ███╗ █████╗ ███╗   ██╗██╗   ██╗███╗   ███╗███████╗██████╗ ██╗ █████╗
                  ██║  ██║██╔══██╗██╔════╝████╗ ████║██╔══██╗████╗  ██║╚██╗ ██╔╝████╗ ████║██╔════╝██╔══██╗██║██╔══██╗
                  ███████║███████║███████╗██╔████╔██║███████║██╔██╗ ██║ ╚████╔╝ ██╔████╔██║█████╗  ██║  ██║██║███████║
                  ██╔══██║██╔══██║╚════██║██║╚██╔╝██║██╔══██║██║╚██╗██║  ╚██╔╝  ██║╚██╔╝██║██╔══╝  ██║  ██║██║██╔══██║
                  ██║  ██║██║  ██║███████║██║ ╚═╝ ██║██║  ██║██║ ╚████║   ██║   ██║ ╚═╝ ██║███████╗██████╔╝██║██║  ██║
                  ╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝   ╚═╝   ╚═╝     ╚═╝╚══════╝╚═════╝ ╚═╝╚═╝  ╚═╝

"
    puts "Welcome to the HasManyMedia database, the command line solution for your Movie, Actor and character finding needs! Can't remember what movie that character is from? Want to prove to your friends that you were totally right about what movie THAT actor was in? Did that actor REALLY play that character? Find out here!"
  end


  def gets_user_input
    puts "Please enter the name of an actor, character, or movie. Names are case sensitive. For instance, type Leonardo DiCaprio with appropriate capital letters :) or type exit to leave :("
    input = gets.chomp
  end


  def find_actor(name)
    actor = Actor.find_by(name: name)
     if actor == nil
       try_again
     else
       puts "*#{name}* is in our database!".bold.green
       puts "Would you like to see a list of '#{name}'s' movies?"
       gets_user_input_movies(actor)
     end
  end


  def find_movies(title)
    movie = Movie.find_by(title: title)
    if movie == nil
      try_again
    else
      puts "*#{movie.title}* is in our database!".bold.green
      puts "Would you like to see a cast list for *#{movie.title}*?"
      get_cast_list_from_movie(movie)
    end
  end


  def find_characters(name)
  character = Character.find_by(name: name)
    if character == nil
      try_again
    else
      puts "*#{character.name}* is in our database!".bold.green
      puts "Would you like to see which actor played *#{character.name}*?"
      gets_user_input_actors_from_characters(character)
    end
  end


  def gets_user_input_actors_from_characters(character)
   yes_or_no
   input = gets.chomp.downcase
   if input == "yes"
     puts "Here is who played that role:".bold.green
     print_actor_from_character(character)
     puts "Would you like to see the movie for this character?"
     print_movies_from_character(character)
   elsif input == "no"
     can_we_help
   else
     gets_user_input_actors_from_characters(character)
   end
 end

 def gets_user_input_movies(actor)
    yes_or_no
    input = gets.chomp.downcase
    if input == "yes"
      puts "Here's a list of *#{actor.name}'s* movies: ".bold.green
      print_all_movies_from_actor(actor)
      puts "Would you like to see a list of *#{actor.name}'s* characters?"
      gets_user_input_characters(actor)
    elsif input == "no"
      can_we_help
    else
      gets_user_input_movies(actor)
    end
  end

  def get_cast_list_from_movie(movie)
    yes_or_no
    input = gets.chomp.downcase
    if input == "yes"
      puts "Here's the cast list for *#{movie.title}*: ".bold.green
      print_all_characters_from_movie(movie)
      puts "Would you like to see the actors for this movie?"
      gets_actors_for_movie(movie)
    elsif input == "no"
      can_we_help
    else
      get_cast_list_from_movie(movie)
    end
  end

  def print_movies_from_character(character)
    input = gets.chomp.downcase
    if input == "yes"
      puts character.movie.title
      can_we_help
    elsif input == "no"
      can_we_help
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
  end

  def print_all_movies_from_actor(actor)
    actor.movies.each do |movie|
      puts movie.title
    end
  end

  def gets_actors_for_movie(movie)
    yes_or_no
    character_input = gets.chomp.downcase
    if character_input == "yes"
      puts "Here's a list of actors for *#{movie.title}*: ".bold.green
      find_all_actors_from_movie(movie)
    elsif character_input == "no"
      can_we_help
    else
      gets_actors_for_movie(movie)
    end
  end


  def gets_user_input_characters(actor)
    yes_or_no
    character_input = gets.chomp.downcase
    if character_input == "yes"
      puts "Here's a list of *#{actor.name}'s* characters: ".bold.green
      find_all_characters_from_actor(actor)
    elsif character_input == "no"
      can_we_help
    else
      gets_user_input_characters(actor)
    end
  end

  def find_all_actors_from_movie(movie)
    movie.actors.each do |actor|
      puts actor.name
    end
    can_we_help
  end

  def find_all_characters_from_actor(actor)
    actor.characters.each do |character|
      puts character.name
    end
    can_we_help
  end

  def exit_or_continue
    yes_or_no
    user_input = gets.chomp.downcase
    if user_input == "yes"
      run
    elsif user_input == "no"
      exit_program
    else
      exit_or_continue
    end
  end

  def try_again
    puts "That information is not in our database.".bold.red
    puts "Remember to check spelling!".blink
    run_again
  end

  def can_we_help
    puts "Anything else we can help you with?"
    exit_or_continue
  end

  def exit_program
    puts "Thank you for choosing the HasManyMedia database for your media query needs."
    puts "Come back soon!".bold.green.blink
  end

  def yes_or_no
    puts "Please enter" + " yes".bold.green + " or" + " no".bold.red + ":"
  end

  def run_again
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
    elsif input == "exit"
      exit_program
    else
      try_again
    end
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
    elsif input == "exit"
      exit_program
    else
      try_again
    end
  end
end
