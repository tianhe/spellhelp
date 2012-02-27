class PopulateListWords < ActiveRecord::Migration
  def change
    words = {}
  	words["2/12"] = %w(word test)
  	words["2/19"] = %w(project tools)
  	words["2/26"] = %w(view)

    pronunciation = {}
  	pronunciation["2/12"] = %w(P0574800 P0574800)
  	pronunciation["2/19"] = %w(P0574800 P0574800)
  	pronunciation["2/26"] = %w(P0574800)

  	["2/12", "2/19", "2/26"].each do |name| 
  		list = List.create name: name 

  		words[name].each_index do |index| 
  			word = Word.create spelling: words[name][index], pronunciation: pronunciation[name][index] 
        ListWord.create list_id: list.id, word_id: word.id, order: index
  		end
  	end

  end
end
