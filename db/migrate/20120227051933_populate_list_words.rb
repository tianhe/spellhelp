class PopulateListWords < ActiveRecord::Migration
  def change
    words = {}
  	words["2/12"] = %w(steady sense pretend discovers tactful breathing perhaps seem squat examine flute
adhere accidentally deftly obstruction tighten apart capture refined silver caught moaned clothes surface
Dying Smashed Grayish)
  	words["2/19"] = %w(dare despair restlessly semblance competition squint patron giggle pleasure cackled
threaten fought client treat rolled hammock luxurious patient restaurant)
  	words["2/26"] = %w(illness though worth shopkeeper admit judicious pulse vibrate sweep foam)
    words["3/3"] = %w(curious residue precipitate speculation stir infinitely distillate manufacture venom excited)
    words["3/10 - Common Verbs"] = %w(accept enjoy happen lead reduce agree allow believe borrow break bring
        carry alternate explain promise remember spend suggest understand settle
      )
    pronunciation = {}
  	pronunciation["2/12"] = %w(S0724900 C0195500 P0546500 D0261100 T0010100 B0469400 P0190700 S0190100
S0683500 E0260100 F0209300 A0086200 A0040800 D0097900 O0016200 T0211300 A0359900 C0094300 R0114900
S0410000 C0171400 M0358800 C0418900 S0912900 D0443400 S0492800 G0244000)
  	pronunciation["2/19"] = %w(D0027800 D0162700 R0184700 S0248900 C0526900 S0686200 P0117400 G0122500 P0367900
      C0010000 T0183600 F0277500 C0404800 T0334000 R0287400 H0038000 L0300200 P0112600 R5198800)
  	pronunciation["2/26"] = %w(I0036700 T0173200 W0231000 S0359500 A0093700 J0074300 P0656200 V0083500 S0938700
      F0218500)
    pronunciation["3/3"] = %w(C0813700 R01758000 P0511200 S0619600 S0764700 I0129500 D0293000  M0092600 V0055200 E0264800)
    pronunciation["3/10 - Common Verbs"] = %w(A0038300 E0150100 H0054300 L0098325 R0107400 A0148100 A0217200 B0170900 B0406200 B0450700 B0485100
        C0129200 C0231500 E0287800 P0592900 R0144700 S0625800 S0869800 U0059300 S0293400)


  	["2/12", "2/19", "2/26", "3/3", "3/10 - Common Verbs"].each do |name|
  		list = List.create name: name

  		words[name].each_index do |index|
  			word = Word.create spelling: words[name][index], pronunciation: pronunciation[name][index]
        ListWord.create list_id: list.id, word_id: word.id, order: index
  		end
  	end

  end
end
