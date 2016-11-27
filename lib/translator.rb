# require modules here
require 'yaml'
# thing = YAML.load_file('emoticons.yml')
# puts thing.inspect


def load_library(file)
  # code goes here
  translations = { "get_meaning" => {}, "get_emoticon" => {} }
  emoticons = YAML.load_file(file)

  emoticons.each do |word, con|
    translations["get_meaning"][con[1]] = word
    translations["get_emoticon"][con[0]] = con[1]
  end
translations
end

def get_japanese_emoticon(file_path, emoticon)
  # code goes here
  emoticons = load_library(file_path)

  emoticons["get_emoticon"].each do |eng_con, jap_con|
    if emoticon == eng_con
      return jap_con
    end
  end

"Sorry, that emoticon was not found"
end

def get_english_meaning(file_path, emoticon)
  # code goes here
  emoticons = load_library(file_path)

  emoticons["get_meaning"].each do |jap_con, word|
    if emoticon == jap_con
      return word
    end
  end

  "Sorry, that emoticon was not found"
end
