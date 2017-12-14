class SecretCodeController < ApplicationController
  before_filter :authenticate_user!
  load_resource

  def index
    @secrets = SecretCode.includes(:user).paginate(:page => params[:page], :per_page => 50).order('id DESC')
    authorize! :read, @secrets
  end

  def generate_codes
    SecretCode.generate_bulk_codes(secret_params[:secret_number].to_i)
    respond_to do |format|
      format.html { redirect_to root_path, notice: "#{secret_params[:secret_number]} Codes successfully created." }
    end
  end

  private
    def secret_params
      params.require(:secret_code).permit(:secret_number)
    end
end
