# Perchwell Fullstack Assessment

## Project Description
This project involves building a Ruby on Rails application to manage and interact with a list of physical buildings. The application serves two types of stakeholders: internal clients who can create and edit buildings, and external clients who can read building information via an API. Additionally, the application supports custom fields associated with each building, tailored to individual clients' needs.


## Installation Instructions

To get started with this project, follow these steps:

### Prerequisites

### Step 1: Clone the Repository

First, clone the repository to your local machine:

```bash
git clone https://github.com/aslanshaken/real-estate.git
cd real-estate
```

### Step 2: Install Backend Dependencies
Install the required gems for Rails:

```bash
bundle install
```

### Step 3: Setup the Database
Create and migrate the database for the Rails backend:

```bash
rails db:create
rails db:migrate
```

### Step 4: Seed the Database
(Optional) Seed the database with initial data:

```bash
rails db:seed
```

### Step 5: Start the Development Servers
Start the Rails backend server in one terminal:

```bash
rails s
```

### Step 7: Access the Application
The Rails backend API will be accessible at http://localhost:3000.

Additional Commands
Run Tests: To run tests for the backend, use:

```bash
rails test
```


### Troubleshooting
Common Issues: If you encounter issues, ensure that all services (PostgreSQL, Rails server) are running correctly and that there are no port conflicts.
Reinstall Dependencies: If you face issues with dependencies, try deleting Gemfile.lock, then reinstall:

```bash
rm Gemfile.lock
bundle install
```