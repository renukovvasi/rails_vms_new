require 'csv' 
class Hrm < ApplicationRecord
  
  def self.to_csv(file)
    binding.pry
    CSV.open(file, "wb") do |csv|
      csv << ["Import status"]
      csv << ["Pending"]
    end
  end
    
end
