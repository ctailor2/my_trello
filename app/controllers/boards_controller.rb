class BoardsController < ApplicationController
  def index
    angular_view('BoardsController')
  end

  def show
    angular_view('BoardController')
  end
end
