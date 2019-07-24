# lignes très pratiques qui appellent les gems du Gemfile. On verra plus tard comment s'en servir ;) - ça évite juste les "require" partout
require 'bundler'
Bundler.require

# lignes qui appellent le fichier lib/app/scrapper.rb
# comme ça, tu peux faire Scrapper.new dans ce fichier d'application. Top.
$:.unshift File.expand_path("./../lib", __FILE__)

require 'app/crypto'

my_crypto_table = Crypto.new

my_crypto_table.crypto_generator
my_crypto_table.end

#binding.pry