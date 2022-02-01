class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def show
    @profile = current_user
    @pins = @profile.pins.with_attached_image.includes(:categories)
  end

end