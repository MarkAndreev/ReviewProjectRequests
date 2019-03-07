class AdminController < ApplicationController

  def dashboard
    @requests = Request.all
  end

end
