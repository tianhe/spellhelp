class AnnouncerController < ApplicationController
  before_filter :authenticate_user!
  before_filter :current_list_id

  def shuffle
    session[:current_list] = params[:id]
    List.find(params[:id]).shuffle

    redirect_to announcer_path(1)
	end

	def index
    @lists = List.all
	end

	def show
    @wordlist_index = params[:id].to_i
    @wordlist_index = 1 if(@wordlist_index == 0)

    @wordlist_count = ListWord.find_all_by_list_id(@current_list_id).count
    @word = ListWord.find_by_list_id_and_order(@current_list_id, @wordlist_index).word
	end

private
  def current_list_id
    @current_list_id = session[:current_list]
  end

end
