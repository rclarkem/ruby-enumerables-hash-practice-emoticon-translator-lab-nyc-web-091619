# require modules here

def load_library(file)
 new_hash = {:get_meaning => {}, :get_emoticon => {}}
	require 'yaml'
  hashObj = YAML.load_file(file)
hashObj.each do |word, meaning_arr|
# p "word: #{word} emoticon: #{meaning_arr[0]}"
if !new_hash[:get_meaning][meaning_arr[1]]
new_hash[:get_meaning][meaning_arr[1]] = word
end
if !new_hash[:get_emoticon][meaning_arr[0]]
new_hash[:get_emoticon][meaning_arr[0]] = meaning_arr[1]
end
end
 new_hash
end

def get_japanese_emoticon(file, emoticon)
emojis = load_library(file)
# p "NEW JAP"
 keyed = emojis[:get_meaning][emoticon]
# p keyed #=> grinning
# p emojis[:get_emoticon][emoticon]
emoji_translations = {keyed => emojis[:get_emoticon][emoticon]}
emoji_translations[keyed] || "Sorry, that emoticon was not found"
end


def get_english_meaning(file, emoticon)
emojis = load_library(file)
# p emojis
emojis[:get_meaning][emoticon] || "Sorry, that emoticon was not found"
end
