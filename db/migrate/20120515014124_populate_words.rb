class PopulateWords < ActiveRecord::Migration
  def change
    words = {}
    words["5/14 - Professions"] = %w(artist athlete painter architect pilot dentist engineer lawyer journalist accountant politician
        professor photographer surgeon scientist entrepreneur inventor businessman banker pharmacist mechanic musician guitarist
      )
    pronunciation = {}
    pronunciation["5/14 - Professions"] = %w(A0447300 A0496700 P0015900 A0408700 P0305300 D0136900 E0145300 L5083100 J0066700 A0044300 P0414300
        P0582600 P0264000 S0915600 S0147600 E0165600 I0213800 B0574200 B0061000 P0235200 M0184100 M0495100 G0308200)


  	["5/14 - Professions"].each do |name|
  		list = List.create name: name

  		words[name].each_index do |index|
  			word = Word.create spelling: words[name][index], pronunciation: pronunciation[name][index]
        ListWord.create list_id: list.id, word_id: word.id, order: index
  		end
  	end

  end
end
