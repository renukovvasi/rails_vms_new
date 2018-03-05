require 'csv'
class Associate < ActiveRecord::Base
  def self.to_csv(users,date)
    #binding.pry
    @date = date.beginning_of_week
    @day1 = @date.strftime('%a/%d/%m')
    @day2 = (@date+1.day).strftime('%a/%d/%m')
    @day3 = (@date+2.day).strftime('%a/%d/%m')
    @day4 = (@date+3.day).strftime('%a/%d/%m')
    @day5 = (@date+4.day).strftime('%a/%d/%m')
    @day6 = (@date+5.day).strftime('%a/%d/%m')
    @day7 = (@date+6.day).strftime('%a/%d/%m')
    column_names =  ["associate_name", "associate_id", "business_unit","project_id","assignment_id","work_group"]
    additional_columns = ["#@day1", "#@day2", "#@day3", "#@day4","#@day5", "#@day6", "#@day7", "Total","Import Status"]
    column_names += additional_columns
    CSV.generate(headers: true) do |csv|
      csv << column_names
      users.each do |user|
        total = 0
        values = []
        add_values = []
        hours = []
        values << user.first.associate_name
        values << user.first.associate_id
        values << user.first.business_unit
        values << user.first.project_id
        values << user.first.assignment_id
        values << user.first.work_group
        #binding.pry
        hours = Hour.where(associate_id: user.first.associate_id, date: (@date..@date+6.day ))
        if hours.present?
            hours.order(:date).each do |f|
              if f.associate_id == user.first.associate_id
                total = total+f.hours
                add_values << f.hours
              end
            end
        else
          i = [0,0,0,0,0,0,0]
          i.each do |k|
            add_values << k
          end
        end
        values += add_values
        values << total
        #binding.pry
        csv << values
      end
    end
  end
end