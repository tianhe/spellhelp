class PopulateNewWords < ActiveRecord::Migration
  def change
    words = {}
    words["6/3 - Root Words"] = %w(astronomy astrology astronaut audible auditorium benefit
      benevolent beneficial biology biography autobiography
      bioscience dictionary dictator dictate geography
      geology geothermal graphic photography autograph)

    pronunciation = {}
    pronunciation["6/3 - Root Words"] = %w(A0487900 A0486800 A0487100 A0516300 A0518300 B0186900
      B0187700 B0186700 B0265500 B0264300 A0533300
      B0268800 D0208800 D0208400 D0208200 G0092800
      G0093300 G0099600 G0233500 P0264200 A0535400)


  	["6/3 - Root Words"].each do |name|
  		list = List.create name: name

  		words[name].each_index do |index|
  			word = Word.create spelling: words[name][index], pronunciation: pronunciation[name][index]
        ListWord.create list_id: list.id, word_id: word.id, order: index
  		end
  	end

  end
end
