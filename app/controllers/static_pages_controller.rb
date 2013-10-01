class StaticPagesController < ApplicationController
  def home
   @upload = current_user.uploads.build if signed_in?    
  end

  def help
  end
  
  def about
  end
  
  def contact
  end
end
