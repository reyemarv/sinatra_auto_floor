
Sinatra Fake Auto Floorplan

This app is a minimal copy of functionality of a floorplan web app. A floorplan is what is used by automotive dealerships to help keep track of inventory. Each system can be for inventory registered for lots, and a seperate one for inventory that have been purchased with a line of credit. This is a start to an ongoing project


Installing: 

1. Fork and Clone repo
2. Load repo into dev editor
3. run 'bundle install'
4. run 'shotgun'
5. hit the browser and go to http://localhost:9393/
6. Play!

In app Flow:

When in app, it will send you to the welcome page, in which you will need to sign in with a username, email, and password. All fields must be filled in and username must be unique. Once completed, you will have ability to logout and log back in with just username and password. 

Once logged in, you will be routed to our floorplan page. This page will display only inventory that belongs to the user currenlty logged in under "current inventory". From here you will have ability to enter a new stock (inventory) by filling out all basic information. Once complete, you will be able to see all inventory entered in you flooprlan page. If you would like to see just one unit, then you can click on link for "view record". It is here that you will have ability as authorized user to edit or even delete entry. 

Future Plans:

I do plan to continue with this project. May be transferred to another framework later on, but goal is to creat a new functioning web app. The final goal will be to have more details on units, including pricing, balance, and description. Also to be able to add more user info incluidng line of credit availability and so on. 

Notes:

A flatiron project with purpose of using Sinatra, Activrecord, and Sqlite3. This project should have ability to allow login, signup, and logout. Full CRUD funcionality. 


get "/dogs"
get "/dogs/:id
get "/dogs/new
post "/dogs"

get "/dogs/:id/edit"
patch "/dogs/:id"

delete "/dogs/:id"

