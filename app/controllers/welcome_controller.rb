class WelcomeController < ApplicationController
  def index
    @app = Application.all
  end
end
