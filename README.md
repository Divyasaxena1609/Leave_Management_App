# Leave Management System

## Overview
This is a Ruby on Rails application that allows employees to apply for leaves and HR to manage leave requests. The application provides a REST API where employees can submit leave requests, and HR can approve or reject them.

## Features

## Employee Functions:

- Apply for leave
- View leave history

## HR/Admin Functions:

- Approve/reject leave requests

- View all leave requests

- Generate leave reports

- Authentication & Role Management

- Database Integration

- RESTful API for seamless interaction

## Technologies Used

- Backend: Ruby on Rails

- Database: PostgreSQL / MySQL

- Authentication: Devise (or JWT-based auth)

- Front-end (Optional): React.js / Angular / ERB Templates

## PORTS

- Backend: http://localhost:3000


## Folder Structure

```
leave_management_system/
│── app/
│   ├── controllers/
│   │   ├── leaves_controller.rb
│   ├── models/
│   │   ├── leave.rb
│   ├── services/
│   │   ├── leave_service.rb
│   ├── views/
│── config/
│   ├── routes.rb
│   ├── database.yml
│── db/
│   ├── migrate/
│── public/
│── temp/
│── Gemfile
│── README.md
```
## How to Run
1. Clone the Repository
```sh
git clone https://github.com/your-repo/leave-management-system.git
cd leave-management-system
```
2. Install Dependencies
```sh
bundle install
```
3. Configure the Database

- Update config/database.yml with your database credentials.

```yaml
development:
  adapter: postgresql
  database: leave_management_dev
  username: postgres
  password: your_password
  host: localhost
  port: 5432
```
4. Set Up the Database

```sh
rails db:create
rails db:migrate
```
5. Run the Application
```sh
rails server
```
