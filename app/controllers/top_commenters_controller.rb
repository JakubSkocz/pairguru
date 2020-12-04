class TopCommentersController < ApplicationController
  
  def index
    @commenters = User.top_commenters
  end

end
