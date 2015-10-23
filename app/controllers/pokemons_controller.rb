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
      attacker = Pokemon.find(params[:attacker])
      attacker.level += 1
      attacker.save
      flash[:notice] = "Damn you roasted this dude. #{pokemon.name} fainted. #{attacker.name} leveled up to level #{attacker.level}"
    end

    pokemon.save
    redirect_to :back
  end

  def heal
    pokemon = Pokemon.find(params[:id])
    pokemon.health += 10
    if pokemon.health >= 100
      pokemon.health = 100
      flash[:notice] = "#{pokemon.name} is at full health! :)"
    end
    pokemon.save
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
