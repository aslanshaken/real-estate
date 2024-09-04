# Perchwell Fullstack Assessment

## Project Description
This project involves building a Ruby on Rails application with a React frontend to manage and interact with a list of physical buildings. The application serves two types of stakeholders: internal clients who can create and edit buildings, and external clients who can read building information via an API. Additionally, the application supports custom fields associated with each building, tailored to individual clients' needs.

## Tech Stack
- **Backend**: Ruby on Rails
- **Frontend**: React
- **Database**: PostgreSQL
- **External APIs**: RESTful API

## Functional Features
- **Client Management**: Ability to manage clients who own the buildings.
- **Building Management**: CRUD operations (Create, Read, Update, Delete) for buildings.
- **Custom Fields**: Support for custom fields associated with each building, configurable per client.
- **API Access**: RESTful API endpoints for external clients to read building information.

## Non-Functional Features
- **Performance**: Optimized database queries and indexing for faster retrieval of data.
- **Scalability**: The application is designed to easily scale with additional clients and buildings.
- **Security**: Basic security measures, such as input validation and error handling.
- **Documentation**: Clear API documentation for easy integration by external clients.

## API Endpoints

### Client-Side Endpoints
1. **Create Building**
   - **Endpoint**: `/buildings`
   - **Method**: POST
   - **Description**: Create a new building associated with a client. Validates data before saving.

2. **Edit Building**
   - **Endpoint**: `/buildings/:id`
   - **Method**: PUT/PATCH
   - **Description**: Edit an existing building by ID with the same constraints as create.

3. **Read Buildings**
   - **Endpoint**: `/buildings`
   - **Method**: GET
   - **Description**: Retrieve all buildings, supports pagination. Returns address, client name, and custom fields.

### Example Response
```json
{
    "status": "success",
    "buildings": [
        {
            "id": "1",
            "client_name": "rock_walls_only",
            "address": "45 Main St",
            "rock_wall_size": "15",
            "rock_wall_length": "26"
        },
        {
            "id": "2",
            "client_name": "brick_walls_only",
            "address": "123 Side St",
            "brick_color": "red",
            "brick_count": ""
        }
    ]
}
```

## Database Schema
The schema includes the following main objects:

- **Clients**
  - Name: String

- **Buildings**
  - Address: String
  - State: String
  - Zip: String
  - Custom Fields: Various types (number, freeform, enum)
  - Associated with Client

- **Custom Field Configuration**
  - Associated with a single client
  - Types: Number (decimal), Freeform (string), Enum (choice of strings)

### Seed Data
- 5 Clients
- A sample of custom fields for each client
- A sample of buildings for each client containing values for the custom fields

## Timeframes

| Component                               | Priority | Estimated Time | Time Invested|
| --------------------------------------- | :------: | :------------: | :-----------:| 
| Setup Rails and React App               | High     | 20 minutes     | -            | 
| Database Schema Design                  | High     | 45 minutes     | -            |
| Implement API Endpoints                 | High     | 45 minutes     | -            |
| Seed Database                           | High     | 10 minutes     | -            |
| Frontend UI and Testing                 | High     | 40 minutes     | -            |  
| Final Documentation                     | Medium   | 10 minutes     | -            |
| Code Review and Submission              | Medium   | 10 minutes     | -            |
| **Total**                               |          | **3 hours**    | -            | 


## Installation Instructions

To get started with this project, follow these steps:

### Prerequisites

Ensure you have the following installed on your machine:
- [Ruby]
- [Rails]
- [PostgreSQL]
- [React]

### Step 1: Clone the Repository

First, clone the repository to your local machine:

```bash
git clone https://github.com/aslanshaken/real-estate.git
cd real-estate
```

### Step 2: Install Backend Dependencies
Navigate to the backend directory and install the required gems for Rails:

```bash
bundle install
```

### Step 3: Install Frontend Dependencies
Navigate to the React frontend directory and install the necessary dependencies:

```bash
cd frontend
yarn install
```

### Step 4: Setup the Database
Create and migrate the database for the Rails backend:

```bash
cd ..
rails db:create
rails db:migrate
```

### Step 5: Seed the Database
(Optional) Seed the database with initial data:

```bash
rails db:seed
```

### Step 6: Start the Development Servers
Start the Rails backend server in one terminal:

```bash
rails s
```

In a separate terminal, navigate to the frontend directory and start the React development server:

```bash
cd frontend
yarn start
```

### Step 7: Access the Application
Open your web browser and go to http://localhost:3000 to view the React frontend. The Rails backend API will be accessible at http://localhost:3001.

Additional Commands
Run Tests: To run tests for the backend, use:

```bash
rails test
```

For frontend tests, use:

```bash
yarn test
```

### Troubleshooting
Common Issues: If you encounter issues, ensure that all services (PostgreSQL, Rails server, React server) are running correctly and that there are no port conflicts.
Reinstall Dependencies: If you face issues with dependencies, try deleting node_modules and Gemfile.lock, then reinstall:

```bash
rm -rf node_modules
rm Gemfile.lock
yarn install
bundle install
```