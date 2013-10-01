class UploadsController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy
  
  def index
  end

  def create
    @upload = current_user.uploads.build(upload_params)
    if @upload.save
      flash[:success] = "Upload succeeded!"
      redirect_to root_url
    else
      render 'static_pages/home'
    end  
  end

  def destroy
    @upload.destroy
    redirect_to current_user    
  end
  
  private

    def upload_params
      params.require(:upload).permit(:name, :content)
    end
    def correct_user
      @upload = current_user.uploads.find_by(id: params[:id])
      redirect_to root_url if @upload.nil?
    end
end