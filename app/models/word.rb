class Word < ActiveRecord::Base
	has_many :lists, through: :list_words
	has_many :list_words

	def pronunciation_url
		"http://ahdictionary.com/application/resources/wavs/#{pronunciation}.wav"
	end
end
