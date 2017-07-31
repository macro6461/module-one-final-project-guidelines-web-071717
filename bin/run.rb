require_relative '../config/environment.rb'
# require_relative '../db/seeds.rb'
#use two dots when you need to exit directory to access a file in different directory

new_cli = CommandLineInterfaceModel.new
new_cli.run
