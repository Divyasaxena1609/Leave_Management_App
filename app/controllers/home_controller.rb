class HomeController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    #render "home/index"
  end
end
