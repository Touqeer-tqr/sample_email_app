class UsersController < ApplicationController

  def index
  end

  def send_email
    Usermailer.welcome_email(params[:email]).deliver_later
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Email Sent, Check Inbox' }
      format.json { head :no_content }
    end
  end

end
