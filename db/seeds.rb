# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name:'Emanuel', city: cities.first)


users = User.create([{name: "shady", password: 'password', password_confirmation: 'password'}])

area1 = Area.create(name: "Contact Info", user: users.first)
area2 = Area.create(name: "Skills", user: users.first)
area3 = Area.create(name: "Education", user: users.first)

attributes = AreaAttribute.create([
     {name: "Phone",value:"0664553444", area:area1},
     {name: "email",value:"ramon.lopez@aon.at", area:area1},
     {name: "address",value:"Kirchstrasse 2", area:area1},

     {name: "Softskills",value:"Strong leadership abilities", area:area2},
     {name: "IT-Skills",value:"Photoshop, Illustrator, Office", area:area2},

     {name: "Highschool",value:"Higher education entrance certificate", area:area3},
     {name: "University - FH Vorarlberg",value:"Bachelor of Science - Software and Information Engineering", area:area3},
     {name: "University - TU Vienna",value:"Master of Science - Software Engineering and Internet Computing", area:area3}])

resume1 = Resume.create(name: "First resume ever", user: users.first)

placeholder1_1 = Placeholder.create(position: 0,resume: resume1, area: area1)
placeholder2_1 = Placeholder.create(position: 1, resume: resume1, area: area2)
placeholder2_1 = Placeholder.create(position: 2, resume: resume1, area: area3)

