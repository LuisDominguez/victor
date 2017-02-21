class WelcomeController < ApplicationController
  def index
  end
  def dashboard
    @articles =Article.all
  end
end
