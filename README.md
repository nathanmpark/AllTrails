# AllTrails Calorie Calculator

The Calorie Calculator is a web application that can estimate calories burned based on hiking distance, pace, and hiker's weight. Available trails are pulled from the AllTrails API.

1. Set a trail from the dropdown selection
2. Use the slider to set a hiking pace
3. Adjust the hiker's weight
4. Hit calculate and see the trail distance, total calories burned, and total hiking time.

# Heroku App Link

http://cc-nathan.herokuapp.com

# Tech

* Ruby on Rails
* PostgreSQL
* HTML5
* CSS3
* AllTrails API
* BootStrap
* http://www.nwhiker.com/calorieburn.html - used to make the calorie calculator backend

# Deployment in command line

1. git clone https://github.com/nathanmpark/CalorieCalculator.git
2. cd CalorieCalculator
3. bundle install
4. rake db:create
5. rake db:migrate
6. rails server 
7. http://localhost:3000/