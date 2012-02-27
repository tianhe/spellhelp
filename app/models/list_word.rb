class ListWord < ActiveRecord::Base
	belongs_to :word
	belongs_to :list
end
