# Advisor
Advisor is an anonymous financial network all about improving the financial well-being of its users through peer-benchmarking, storytelling, and collaboration. 

Think [Bravado](https://bravado.co/home) mixed with the [personal finance subreddit](https://www.reddit.com/r/personalfinance/), but totally anonymized.

It consists of three main features:
- A self-onboarding experience to set up your profile, offering insight into your current financial and demographic information
- A network search page where you can filter other users based on financial and demographic settings
- A basic chat application to message other users (currently not functional)

Unfortunately, this project never got further than an MVP running on a laptop. It was a pet project between two old college friends. It was a lot of fun working through the idea and writing the code.

If we were to come back to this project, we would:
- Refine the signup & self-onboarding experience 
- Get chat working
- Add forums
- Build integrations with personal finance management apps like rocket money

## Stack

- Docker
- React JS frontend
- Django python backend
- Meant to be deployed using AWS (AWS connection not required to run locally)

## How to get things running

- Clone this repository
- Run `git submodule init && git submodule update`
  - This repo points to commits of webservices and frontend
- Run the following command to set up environment variables for backend
  - `cp webservices/.env.example webservices/.env`
- Make sure Docker is installed on your machine
- Run `docker-compose up --build -d`
  - This may take a few minutes the first time you run it
- Build a simulated dataset do make the network search meaningful
  - Get into an interactive shell using `docker-compose exec backend bash`
  - Run the `simulate_dataset` management command using `python webservices/manage.py simulate_dataset`
- Now create a superuser by running `python webservices/manage.py createsuperuser`
- Now navigate to the `frontend` directory
- Run the following command to set up environment variables for frontend
  - `cp .env.example .env`
- Run `yarn start`
  - This will take you to a login screen at `localhost:3000`
- After logging in, you will be walked through the self-onboarding experience
- Following the completion of setting up your profile, you are good to go!


## FAQ

- How can I reset the database?
  - Go to the `postgres` folder and delete its contents, then rebuild the postgres container.
  - If you wish to rebuild the simulation data, do that using `python webservices/manage.py simulate_dataset`