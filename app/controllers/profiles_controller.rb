class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def show
    @profile = current_user
    @pins = @profile.pins
  end

end