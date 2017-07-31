# require 'pry'
class CommandLineInterfaceModel

  def greet
    puts "Welcome to the MovieActorCharacter Database, the command line solution for your Movie, Actor and character finding needs! Can't remember what movie that character is from? Want to prove to your friends that you were totally right about what movie THAT actor was in? Did that actor REALLY play that character? Find out here!"
  end


  def gets_user_input_actors
    puts "Start your search by entering an actor's name:"
    #what could we put here to allow a user to type a response?
    actor_input = gets.chomp
  end

  # def gets_user_input_movies
  #   puts "Please Enter Yes or No:"
  #   movie_input = gets.chomp
  #   if !movie_input == "Yes" && !movie_input == "No"
  #     puts "Please enter a valid answer:"
  #   else
  #     puts find_movies(self)
  #   end
  # end

  # def find_movies(actor)
  #   actor = self
  #   actor.movies
  # end

  def find_actor(first_name, last_name)
    actor = Actor.find_by(first_name: first_name, last_name: last_name)
  #   if actor = true
  #     puts "#{first_name} #{last_name} is in our database!"
  #   else
  #     puts "Try Again."
  #   end
  #   # binding.pry
  end

  def run
    greet
    input = gets_user_input_actors.split(" ")
    find_actor(input[0], input[1])
  end

end
