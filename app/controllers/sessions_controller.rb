class SessionsController < ApplicationController
  def new
  end
  def create
    user = Admin.find_by(username: params[:session][:username].downcase)
    if user.present?
      if user.password == (params[:session][:password])
        respond_to do |format|
          format.html { redirect_to home_associates_path }
        end
      else
        respond_to do |format|
          format.html { redirect_to root_url, notice: 'Please check username and password' }
        end
      end
    elsif
      user = HRadmin.find_by(username: params[:session][:username].downcase)
      if user.present?
        if user.password == (params[:session][:password])
          respond_to do |format|
            format.html { redirect_to home_hrmsdata_path }
          end
        else
          respond_to do |format|
            format.html { redirect_to root_url, notice: 'Please check username and password' }
          end
        end
      end
    else
      
    end
  end

end
