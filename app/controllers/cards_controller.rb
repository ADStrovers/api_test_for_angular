class CardsController < ApplicationController
  before_action :set_card, only: [:show, :update, :destroy]
  
  def index
    @cards = Card.all
    
    render json: @cards
  end

  def show
    render json: @card
  end

  def create
    @card = Card.new(card_params)
    
    if @card.save
      render json: @card, status: :created, location: @card
    else
      render json: @card.errors, status: :unprocessable_entity
    end
  end

  def update
    @card = Card.find(params[:id])
    
    if @customer.update(card_params)
      head :no_content
    else
      render json: @card.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @card.destroy
    
    head :no_content
  end
  
  private
  
  def set_card
    @card = Card.find(params[:id])
  end
  
  def card_params
    params.require(:card).permit(:title, :body)
  end
end
