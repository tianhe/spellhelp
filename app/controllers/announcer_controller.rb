class AnnouncerController < ApplicationController
  before_filter :current_list_id

  def shuffle
    List.find(@current_list_id).shuffle
    redirect_to announcer_path(1, id: 1)
	end

	def index    
	end

	def show        
    @wordlist_index = params[:id].to_i  
    @wordlist_index = 1 if(@wordlist_index == 0)  
    
    @wordlist_count = ListWord.find_all_by_list_id(@current_list_id).count
    @word = ListWord.find_by_list_id_and_order(@current_list_id, @wordlist_index).word
	end

private
  def current_list_id
    @current_list_id = 2
  end

end
