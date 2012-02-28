class PopulateListWords < ActiveRecord::Migration
  def change
    words = {}
  	words["2/12"] = %w(steady sense pretend discovers tactful breathing perhaps seem squat examine flute
adhere accidentally deftly obstruction tighten apart capture refined silver caught moaned clothes surface
Dying Smashed Grayish)
  	words["2/19"] = %w(dare despair restlessly semblance competition squint patron giggle pleasure cackled
threaten fought client treat rolled hammock luxurious patient restaurant)
  	words["2/26"] = %w(illness though worth shopkeeper admit judicious pulse vibrate sweep foam)

    pronunciation = {}
  	pronunciation["2/12"] = %w(S0724900 C0195500 P0546500 D0261100 T0010100 B0469400 P0190700 S0190100
S0683500 E0260100 F0209300 A0086200 A0040800 D0097900 O0016200 T0211300 A0359900 C0094300 R0114900
S0410000 C0171400 M0358800 C0418900 S0912900 D0443400 S0492800 G0244000)
  	pronunciation["2/19"] = %w(D0027800 D0162700 R0184700 S0248900 C0526900 S0686200 P0117400 G0122500 P0367900
      C0010000 T0183600 F0277500 C0404800 T0334000 R0287400 H0038000 L0300200 P0112600 R5198800)
  	pronunciation["2/26"] = %w(I0036700 T0173200 W0231000 S0359500 A0093700 J0074300 P0656200 V0083500 S0938700
      F0218500)

  	["2/12", "2/19", "2/26"].each do |name|
  		list = List.create name: name

  		words[name].each_index do |index|
  			word = Word.create spelling: words[name][index], pronunciation: pronunciation[name][index]
        ListWord.create list_id: list.id, word_id: word.id, order: index
  		end
  	end

  end
end
