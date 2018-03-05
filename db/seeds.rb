# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
=begin
admin_list = [
["timesheet.admin05@tcs.com","timesheet.admin05", "Password01"],
["timesheet.admin06@tcs.com","timesheet.admin06","Password02"],
["Teamadmin@tcs.com","Teamadmin","Teamadmin@123"],
["standard.user08@tcs.com","standard.user08","VMS#6789"],["payrollaccess@tcs.com","payrollaccess","user_payroll"],
["Vms.admin@tcs.com","Vms.admin","Admin@1234"],["Timedata_manager@tcs.com","Timedata_manager","time@pwd!"],
["standard.recuit@tcs.com","standard.recuit","Password_recuit"],
["hr.admin01@tcs.com","hr.admin01","Password01#"],["hr.admin01@tcs.com","hr.admin01","Password02@"],
["Timeadmin_hr@tcs.com","Timeadmin_hr","Timeadmin@123HR"],["Standard.hrmsuser08@tcs.com","Standard.hrmsuser08","HRMS#6789"],
["payrollcontroller@tcs.com","payrollcontroller","user_payroll98"],["HRMS.supervisor@tcs.com","Admin%1234"],
["Timefield_manager@tcs.com","Timefield_manager","time@password3"],["standard.hruser@tcs.com","standard.hruser","Password_user54"]
]
admin_list.each do |admin|
    Admin.create(email: admin[0],password: admin[2], username: admin[1])
end
#Associate name Business Unit	Project ID	Assignment ID	Work Group	Payroll Center	Associate ID	startdate enddate status
associate_list = [
["Johannes Kepler","US011","AD0000564","AID000001","PayCenter01","AD47065","29 Jan 2018","20 Feb, 2018", "Submitted"],
["Geoff MacKay","US017","AD0000542","AID000002","PayCenter02","AD62907","5 Feb 2018","15 Feb 2018","Approved"],
["Kathy Wise","EU798","TCS090092","AID000003","PayCenter03","TCS87598","5 Feb 2018","18 Feb 2018","Approved"],
["Tom Scott","EU110","MS0001A","AID000004","PayCenter04","EU00087","19 Jan 2018","30 Jan,2018","Adjusted"],
["Cynthia Adams","US0600","TS111001","AID000005","PayCenter05","100897","1 Jan 2018","4 Feb 2018","Submitted"],
["Tom Williams","DE006","AD0000044","AID000006","PayCenter06","DE11567","3 Feb 2018","11 Mar 2018","Open"],
["Alex Ziglar","DE1102","AD0000041","AID000007","PayCenter07","TS87589","12 Mar,2018","18 Apr 2018","Submitted"],
["Sylvia Reese","IR002","TS110048","AID000008","PayCenter08","876749","1 Mar 2018","30 Mar 2018","Approved"],
["Cynthia Adams","EU110","TS111002","AID000005","PayCenter05","100897","4 Feb 2018","4 Mar 2018","Submitted"],
]

associate_list.each do |user|
    Associate.create(associate_name: user[0],business_unit: user[1], project_id: user[2], assignment_id: user[3],
    payroll_center: user[4], associate_id: user[5],start_date: user[6], end_date: user[7], 
    status: user[8])
end
=end


admin_list =[
  ["hr.admin01@tcs.com","hr.admin01","Password01#"],["hr.admin01@tcs.com","hr.admin01","Password02@"],
  ["admin@tcs.com","admin","admin123"]
    ]
    
admin_list.each do |i|
  HRadmin.create(email: i[0],username: i[1],password: i[2] )
end
