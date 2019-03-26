require "yaml"
require "pry"

def load_library(path)
  list = {"get_meaning" => {}, "get_emoticon" => {}}
  YAML.load_file(path).each do |k, v|
    list["get_meaning"][v[1]] = k
    list["get_emoticon"][v[0]] = v[1]
  end
  list
end

def get_japanese_emoticon(path,emoticon)
  hash = load_library(path)
  hash["get_emoticon"][emoticon] || "Sorry, that emoticon was not found"
end

def get_english_meaning(path,emoticon)
  hash = load_library(path)
  hash["get_meaning"][emoticon] || "Sorry, that emoticon was not found"
end