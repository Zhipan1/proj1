class PokemonsController < ApplicationController

  def capture
    pokemon = Pokemon.find(params[:id])
    pokemon.trainer = current_trainer
    pokemon.save
    redirect_to :root
  end

  def damage
    pokemon = Pokemon.find(params[:id])
    pokemon.health -= 10

    if pokemon.health <= 0
      pokemon.destroy
      flash[:notice] = "Damn you roasted this dude. #{pokemon.name} is dead AF."
    else
      pokemon.save
    end

    redirect_to :back
  end

  def new
    @pokemon = Pokemon.new
  end

  def create
    name = params[:pokemon][:name]
    pokemon = Pokemon.create name: name, level: 1, health: 100, trainer: current_trainer
    if pokemon.valid?
      flash[:notice] = "AY LMAO. Pokemon #{name} created!"
      redirect_to current_trainer
    else
      flash[:error] = pokemon.errors.full_messages.to_sentence
      redirect_to :back
    end
  end



end
