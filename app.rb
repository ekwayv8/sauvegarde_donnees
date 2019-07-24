# lignes très pratiques qui appellent les gems du Gemfile. On verra plus tard comment s'en servir ;) - ça évite juste les "require" partout
require 'bundler'
Bundler.require

# lignes qui appellent le fichier lib/app/scrapper.rb
# comme ça, tu peux faire Scrapper.new dans ce fichier d'application. Top.
:.unshift File.expand_path("./../../app", __FILE__)

require_relative 'scrapper'

#my_scrapper= Scrapper.new

binding.pry