require './converter'
require 'tty'
require 'pry'

prompt = TTY::Prompt.new
x =prompt.yes?('Do you like Ruby?')
puts x.inspect
y = prompt.select("Choose your destiny!", %w(Scorpion Kano Jax))
binding.pry 
