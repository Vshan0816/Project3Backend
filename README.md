# Anime Project app, frontend   

## Description

This project is structured around the concept an anime belonging to a studio. The frontend is created with React while the backend is created with Sinatra and Active Record. The goal was to create a web basic API with Sinatra and Active Record to support a React frontend. In the backend, We had to create a database with a one-to-many relationship. In this case we have the models anime and studio. A studio has many animes, and an anime belongs to a singular studio. We also had to establish 3 CRUD actions that would work from the front-end communicating with backend API routes in Sinatra.

The github for the frontend can be found here:
https://github.com/Vshan0816/Project3Frontend

## Installation

1. Fork and clone the repository
2. Cd into the project and run bundle install
3. reset the database with: rake reset_db
4. Run the server with: shotgun

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## License

[MIT](https://choosealicense.com/licenses/mit/)