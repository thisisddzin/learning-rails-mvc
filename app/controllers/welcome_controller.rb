# frozen_string_literal: true

class WelcomeController < ApplicationController
  def index
    @users = %w[Adenilson Rômulo Matheus]
    @name = params[:name]

    @welcome_text = welcome <<-ABC
      VOCÊS QUE ESTÃO ONLINE, MUITO BEM VINDOS!!!
      OK!
    ABC
  end

  private

  def welcome(text)
    @users.join(', ') + text
  end
end
