require_relative '../config/environment.rb'
# require_relative "../lib/api_communicator.rb"
# require_relative "../lib/command_line_interface.rb"
# require_relative '../db/seeds.rb'
#use two dots when you need to exit directory to access a file in different directory

new_cli = CommandLineInterfaceModel.new
new_cli.run
