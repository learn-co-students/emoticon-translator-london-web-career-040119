require 'yaml'

def load_library(file_path)
  data = YAML.load_file(file_path)
  result_hash = {
    "get_meaning" => {},
    "get_emoticon" => {}
  }

  data.each_with_object(result_hash) do |(meaning, emoticons), result|
    result["get_meaning"][emoticons[1]] = meaning 
    result["get_emoticon"][emoticons[0]] = emoticons[1]
  end
end

def get_japanese_emoticon(yaml_file, emoticon)
  data = load_library(yaml_file)["get_emoticon"]
  result = data.find { |en_emoticon, jp_emoticon| en_emoticon == emoticon}
  result ? result[1] : "Sorry, that emoticon was not found"
end

def get_english_meaning(yaml_file, emoticon)
  data = load_library(yaml_file)["get_meaning"]
  result = data.find { |en_emoticon, jp_emoticon| en_emoticon == emoticon}
  result ? result[1] : "Sorry, that emoticon was not found"
end