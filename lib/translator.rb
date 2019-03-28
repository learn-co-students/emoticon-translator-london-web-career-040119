require 'pry'
require 'yaml'
# require modules here

def load_library(file)

  dictionary = YAML.load_file(file)

  hash = {
    "get_emoticon" =>{},
    "get_meaning" => {}
  }


  dictionary.each do |word, emoticons|
    hash["get_emoticon"][emoticons[0]] = emoticons[1]
    hash["get_meaning"][emoticons[1]] = word
  end
hash
end

def get_japanese_emoticon
  # code goes here
end

def get_english_meaning
  # code goes here
end
