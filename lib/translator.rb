require 'pry'
require 'yaml'

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

def get_japanese_emoticon(file, emoticon)

  dictionary = load_library(file)

  if dictionary["get_emoticon"].keys.include?(emoticon)
    dictionary["get_emoticon"][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(path, emoticon)

  dictionary = load_library(path)
  if dictionary["get_meaning"].keys.include?(emoticon)
    dictionary["get_meaning"][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end
