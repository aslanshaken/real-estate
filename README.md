# Perchwell Assessment

## Project Description
This project involves building a Ruby on Rails application to manage and interact with a list of physical buildings. The application caters to two types of stakeholders:
- **Internal Clients**: Can create and edit buildings.
- **External Clients**: Can access building information via an API.

Additionally, the application supports custom fields for each building, allowing clients to define specific attributes according to their needs.

## Documentation
Please review the [Notion Documentation](https://succulent-tortoise-2a9.notion.site/Perchwell-Assessment-a4fca24109b448c8b90807ae6433189b?pvs=4) for detailed information about the project.

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

### Step 6: Access the Application
The Rails backend API will be accessible at http://localhost:3000.

### Troubleshooting
Common Issues: If you encounter issues, ensure that all services (PostgreSQL, Rails server) are running correctly and that there are no port conflicts.
Reinstall Dependencies: If you face issues with dependencies, try deleting Gemfile.lock, then reinstall:

```bash
rm Gemfile.lock
bundle install
```