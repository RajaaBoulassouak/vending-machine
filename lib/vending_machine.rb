require 'json'
require './lib/content_row'

puts "Hello, please enter a command:
(c)ontents - Prints the contents of the vending machine.
(i)nsert money - Takes in coins and prints total money inserted.
(v)alid coin values - Prints the valid coins inputs:  Accepts coins of 1,5,10,25 Cents i.e. penny, nickel, dime, and quarter.
(p)urchase - Displays a prompt to enter the slot they'd like to purchase."

user_input = gets.chomp

if user_input == "c"
  raw_data = File.read('./data/tiny_vending_machine.json')
  parsed_data = JSON.parse(raw_data)
  content = []
  content_rows = parsed_data["contents"].map do |row|
    row.map do |key, value|
      content_array = [key, value]
      content << ContentRow.new(content_array)
    end
  end
  content.map do |cont|
    cont.contents.map do |cont_h|
      puts cont_h["type"]
    end
  end
elsif user_input == "i"
  puts "Please insert your money! Valid coins 1,5,10,25"
  coin_input = gets.chomp
  unless coin_input == "1" || "5" || "10" || "25"
    puts "Not a valid coin! Valid coins 1, 5, 10, 25"
    gets.chomp
  else 
    puts "Please insert your money!"
  end
end
