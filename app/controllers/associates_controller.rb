class AssociatesController < ApplicationController
    def login
      @text = VMS_PORTAL
    end
    
    def home
      @text = VMS_PORTAL
      
    end
    
    def index
      @text = VMS_PORTAL
      @@associates_list = []
    end
    def reset
      @@associates_list = []
      redirect_to associates_path
    end
    
    def search
      if params[:commit] == "Search"
        @text = VMS_PORTAL
        @@date = params[:start_date].to_date
        if params[:project_id].present? && params[:associate_id].present?
          @associates = Associate.where(project_id: params[:project_id],associate_id: params[:associate_id])
        elsif params[:associate_id].present?
          @associates = Associate.where(associate_id: params[:associate_id])
        elsif params[:project_id].present?
          @associates = Associate.where(project_id: params[:project_id])
        end
        @@associates_list += @associates
        @loop1 = TEST_VALUE1
        @loop2 = TEST_VALUE2
        render :template => "associates/index", :locals => { :@associates => @@associates_list, :@date => @@date, :@j => @loop2 }
      else
        redirect_to reset_associates_path
      end
    end
    
    def export 
      @text = VMS_PORTAL
      @users = []
      @date = @@date.to_datetime.getutc
      if params[:user_ids].present?
        params[:user_ids].each_with_index do |value, i|
          @users << Associate.where(associate_id: params[:user_ids][i])
        end
        respond_to do |format|
          format.html 
          format.csv { send_data Associate.to_csv(@users,@date), filename: "users-#{Date.today}.csv" }
        end
      else
        flash[:notice] = "Please select Records"
        
      end
      
    end
end
