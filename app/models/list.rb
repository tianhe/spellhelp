class List < ActiveRecord::Base
	has_many :words, through: :list_words
	has_many :list_words

	def shuffle
    randomized_array = (1..list_words.count).to_a.shuffle
    list_words.each_index{ |index| list_words[index].update_attribute(:order, randomized_array[index]) }
	end

end
