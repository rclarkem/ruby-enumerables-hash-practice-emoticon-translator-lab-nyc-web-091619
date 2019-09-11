# require modules here

def load_library(file)
  require 'yaml'
  hashObj = YAML.load_file(file)
new_hash = {:get_meaning => {}, :get_emoticon => {}}
hashObj.each do |word, meaning_arr|
# p "word: #{word} emoticon: #{meaning_arr[0]}"
new_hash[:get_meaning][meaning_arr[1]] = word
end
new_hash[:get_emoticon][meaning_arr[0]] = meaning_arr[1]
end
end
 new_hash
end

def get_japanese_emoticon(file, emoticon)
emojis = load_library(file)
 keyed = emojis[:get_meaning][emoticon]
# p keyed #=> grinning
# p emojis[:get_emoticon][emoticon]
emoji_translations = {keyed => emojis[:get_emoticon][emoticon]}
emoji_translations[keyed] || "Sorry, that emoticon was not found"
end

=begin
def get_japanese_emoticon(file, emoticon)
emojis = load_library(file)
 english_word_meaning = emojis[:get_emoticon][emoticon]
 p english_word_meaning
english_word_meaning
end
=end

def get_english_meaning(file, emoticon)
emojis = load_library(file)
# p emojis
emojis[:get_meaning][emoticon] || "Sorry, that emoticon was not found"
end
