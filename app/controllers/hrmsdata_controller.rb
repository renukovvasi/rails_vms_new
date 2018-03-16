require 'csv'
require 'spreadsheet'
require 'writeexcel'
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
      list = params[:list_data]
      @date = params[:date].scan(/\d+/).reverse!.join.to_date.to_datetime.getutc
      ar_list = []
      list.each do |p|
        ar_list.push(list[p])
      end
      count = ar_list.count
      @user_list = []
      j=0
      ar_list.each do |i|
        a = Hrm.where(associate_id: i[2], project_id: i[4]).first
        if a.present?
          Hrhour.where(associate_id: i[2], date: @date).first.update_attribute :hours,ar_list[count-1][j]
          Hrhour.where(associate_id: i[2], date: @date+1.day).first.update_attribute :hours,ar_list[count-1][j+1]
          Hrhour.where(associate_id: i[2], date: @date+2.day).first.update_attribute :hours,ar_list[count-1][j+2]
          Hrhour.where(associate_id: i[2], date: @date+3.day).first.update_attribute :hours,ar_list[count-1][j+3]
          Hrhour.where(associate_id: i[2], date: @date+4.day).first.update_attribute :hours,ar_list[count-1][j+4]
          Hrhour.where(associate_id: i[2], date: @date+5.day).first.update_attribute :hours,ar_list[count-1][j+5]
          Hrhour.where(associate_id: i[2], date: @date+6.day).first.update_attribute :hours,ar_list[count-1][j+6]
          j += 7
          @user_list << a
        end
      end
      @notice = "Records updated Successfully"
      return @notice
      render :template => "hrmsdata/index", :locals => {:notice => @notice}
      
    end
    
    
    
    def import
      @text = HRMS_PORTAL
      spreadsheet = Roo::Spreadsheet.open(params[:file].path)
      @file = params[:file].path
      header = spreadsheet.row(1)[6]
      @date = header.split('/').reverse!.join('/').to_date.beginning_of_week.to_datetime.getutc
      @a_list = []
    
      (2..spreadsheet.last_row).each do |i|
        h = Hrhour.where(associate_id: (spreadsheet.row(i)[1]), date: (@date..@date+7.day ))
        #binding.pry
        if (spreadsheet.row(i)[13]).to_i > 40 && h.empty?
          a = Hrm.create(associate_name: spreadsheet.row(i)[0],associate_id: spreadsheet.row(i)[1], assignment_id: spreadsheet.row(i)[4],
          project_id: spreadsheet.row(i)[3], business_unit: spreadsheet.row(i)[2], work_group: spreadsheet.row(i)[5] )
          Hrhour.create(associate_id: spreadsheet.row(i)[1],project_id: spreadsheet.row(i)[3], hours: spreadsheet.row(i)[6], date: @date)
          Hrhour.create(associate_id: spreadsheet.row(i)[1],project_id: spreadsheet.row(i)[3], hours: spreadsheet.row(i)[7], date: @date+1.day)
          Hrhour.create(associate_id: spreadsheet.row(i)[1],project_id: spreadsheet.row(i)[3], hours: spreadsheet.row(i)[8], date: @date+2.day)
          Hrhour.create(associate_id: spreadsheet.row(i)[1],project_id: spreadsheet.row(i)[3], hours: spreadsheet.row(i)[9], date: @date+3.day)
          Hrhour.create(associate_id: spreadsheet.row(i)[1],project_id: spreadsheet.row(i)[3], hours: spreadsheet.row(i)[10], date: @date+4.day)
          Hrhour.create(associate_id: spreadsheet.row(i)[1],project_id: spreadsheet.row(i)[3], hours: spreadsheet.row(i)[11], date: @date+5.day)
          Hrhour.create(associate_id: spreadsheet.row(i)[1],project_id: spreadsheet.row(i)[3], hours: spreadsheet.row(i)[12], date: @date+6.day)
          @a_list << a
        elsif (spreadsheet.row(i)[13]).to_i > 40
            @a_list << Hrm.where(associate_id: spreadsheet.row(i)[1]).first
        
        end
      end
      flash[:notice] = "Records Imported Successfully"
      render :template => "hrmsdata/index", :locals => {:@list => @a_list, :@date => @date}  
    end
end
