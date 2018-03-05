class HrmsdataController < ApplicationController
    def login
      @text = HRMS_PORTAL
    end
 
    def index
      @text = HRMS_PORTAL
     
    end
    def home
    end
    
    def update
    end
    
    def search
    end
    
    def import
      @text = HRMS_PORTAL
      spreadsheet = Roo::Spreadsheet.open(params[:file].path)
      header = spreadsheet.row(1)[5]
      @date = header.split('/').reverse!.join('/').to_date.beginning_of_week
      @a_list = []
      #binding.pry
      (2..spreadsheet.last_row).each do |i|
         a = Hrm.create(associate_name: spreadsheet.row(i)[1],associate_id: spreadsheet.row(i)[0], assignment_id: spreadsheet.row(i)[3],
         project_id: spreadsheet.row(i)[2])
         Hrhour.create(associate_id: spreadsheet.row(i)[0],project_id: spreadsheet.row(i)[2], hours: spreadsheet.row(i)[4], date: @date)
         Hrhour.create(associate_id: spreadsheet.row(i)[0],project_id: spreadsheet.row(i)[2], hours: spreadsheet.row(i)[5], date: @date+1.day)
         Hrhour.create(associate_id: spreadsheet.row(i)[0],project_id: spreadsheet.row(i)[2], hours: spreadsheet.row(i)[6], date: @date+2.day)
         Hrhour.create(associate_id: spreadsheet.row(i)[0],project_id: spreadsheet.row(i)[2], hours: spreadsheet.row(i)[7], date: @date+3.day)
         Hrhour.create(associate_id: spreadsheet.row(i)[0],project_id: spreadsheet.row(i)[2], hours: spreadsheet.row(i)[8], date: @date+4.day)
         Hrhour.create(associate_id: spreadsheet.row(i)[0],project_id: spreadsheet.row(i)[2], hours: spreadsheet.row(i)[9], date: @date+5.day)
         Hrhour.create(associate_id: spreadsheet.row(i)[0],project_id: spreadsheet.row(i)[2], hours: spreadsheet.row(i)[10], date: @date+6.day)
        @a_list << a
      end
      render :template => "hrmsdata/index", :locals => {:@list => @a_list, :@date => @date}  
    end
end
