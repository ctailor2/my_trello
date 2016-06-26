class UsersController < ApplicationController
  skip_before_filter :authenticate!

  def new
    regular_view
  end
end

