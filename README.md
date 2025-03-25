# Leave Management System

## Overview
This is a Ruby on Rails application that allows employees to apply for leaves and HR to manage leave requests. The system provides a REST API for employees to submit leave requests and for HR to approve or reject them. The system also supports email notifications for leave approvals and rejections using SMTP.

## Features

## Employee Functions:

- Apply for leave
- View leave history

## HR/Admin Functions:

- Approve/reject leave requests

- View all leave requests

- Generate leave reports

- Authentication & Role Management

- Email Notifications for Leave Requests (via SMTP)

- Database Integration with SQLite

- RESTful API for seamless interaction

## Technologies Used

- Backend: Ruby on Rails

- Database: SQLite

- Authentication: Devise (or JWT-based auth)

- Email Service: SMTP (Gmail)

- Front-end : ERB Templates

## PORTS

- Backend: http://localhost:3000

## SMTP Configuration

- This application supports email notifications for leave approvals/rejections via Gmail SMTP.

- Configuration in config/environments/development.rb:
  
 ```ruby
config.action_mailer.delivery_method = :smtp
config.action_mailer.perform_deliveries = true
config.action_mailer.raise_delivery_errors = true
config.action_mailer.default_url_options = { host: "localhost", port: 3000 }

config.action_mailer.smtp_settings = {
  address: "smtp.gmail.com",
  port: 587,
  domain: "gmail.com",
  user_name: ENV['USER_NAME'],
  password: ENV['PASSWORD'],
  authentication: "plain",
  enable_starttls_auto: true
}
```

## Setting Up Environment Variables

- Before running the application, set your Gmail credentials as environment variables:

- For Linux/macOS (add this to ~/.bashrc or ~/.zshrc):

```sh
export USER_NAME='your-email@gmail.com'
export PASSWORD='your-email-password'
```

- For Windows (PowerShell):

```powershell
$env:USER_NAME="your-email@gmail.com"
$env:PASSWORD="your-email-password"
```

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
  adapter: sqlite3
  database: db/development.sqlite3
  pool: 5
  timeout: 5000
```
4. Set Up the Database

```sh
rails db:create
rails db:migrate
```
5. Set Up Environment Variables (For Email Notifications)

```sh
export USER_NAME='your-email@gmail.com'
export PASSWORD='your-email-password'
```
6. Run the Application
```sh
rails server
```
## Output

- Leave requests are stored in the SQLite database (db/development.sqlite3).

- Employees can track their leave status.

- HR can approve/reject leave requests.

- Email notifications are sent for leave approvals/rejections.


