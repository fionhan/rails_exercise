class DecksController < ApplicationController
  def index
    @decks=Deck.all
  end
  def show
    @deck=Deck.find(params[:id])
  end
  def new
    @deck=Deck.new
  end
  def create
    @deck=Deck.new(deck_params)
    @deck.save
    puts decks_path
    redirect_to decks_path
  end

  def destroy
    @deck=Deck.find(params[:id])
    @deck.destroy

    #wrong code 1
    #result: in chrome it will request to this action all the time untill it find a right redirect page
    #        in firefox it will request twice at most
    #redirect_to "decks" =>localhost:3000decks

    #wrong code 2
    #result: it will run to a faild page
    #redirect_to "/abcdefg" =>localhost:3000/abcdefg

    redirect_to "/decks"

  end

  private
  def deck_params
    params.require(:deck).permit(:name)
  end
end
