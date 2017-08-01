require 'pry'
class CommandLineInterfaceModel

  def greet
    puts "Welcome to the MovieActorCharacter Database, the command line solution for your Movie, Actor and character finding needs! Can't remember what movie that character is from? Want to prove to your friends that you were totally right about what movie THAT actor was in? Did that actor REALLY play that character? Find out here!"
  end

  def gets_user_input
    puts "Enter the name of an Actor, Movie or Character:"
    #what could we put here to allow a user to type a response?
    actor_input = gets.chomp
  end

  def find_actor(first_name, last_name)
    actor = Actor.find_by(first_name: first_name, last_name: last_name)
     if !Actor.all.include?(actor)
       try_again
     elsif Actor.all.include?(actor)
       puts "#{first_name} #{last_name} is in our database! Would you like to see a list of #{first_name} #{last_name}'s movies?"
       gets_user_input_movies(actor)
     end
      #binding.pry
  end

  def try_again
    puts "That actor is not in our database. Please check spelling or "
    input = gets_user_input.split(" ")
    find_actor(input[0], input[1])
  end

  def gets_user_input_movies(actor)
    puts "Please Enter Yes or No:"
    movie_input = gets.chomp
    if movie_input == "Yes"
      puts "Here's a list of #{actor.full_name}'s movies: "
      find_all_movies_from_actor(actor)
      puts "Would you like to see a list of #{actor.full_name}' characters?"
      gets_user_input_characters(actor)
    elsif movie_input == "No"
      puts "Ok."
      # puts find_movies(self)
    end
  end

  def find_all_movies_from_actor(actor)
    # char = Character.all.find do |character|
    #   character.actor_id == actor.id
    # end
    # char.movie_id
    # character = find_all_characters_from_actor(actor)
    actor.movies.each do |movie|
      puts movie.title
    end
    # find_all_characters_from_actor(actor)
    # binding.pry
  end
  # binding.pry

  def gets_user_input_characters(actor)
    puts "Please Enter Yes or No:"
    character_input = gets.chomp
    if character_input == "Yes"
      puts "Here's a list of #{actor.full_name}'s characters: "
      find_all_characters_from_actor(actor)
    elsif character_input == "No"
      puts "Ok."
      # puts find_movies(self)
    end
  end

  def find_all_characters_from_actor(actor)
    # if Character.actor_id == actor.id
    #   character = Character.name
    # end
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
    end
  end


  def run
    greet
    input = gets_user_input.split(" ")
    find_actor(input[0], input[1])
  end

end
