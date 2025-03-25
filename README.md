Leave Management App
A Ruby on Rails-based application that allows employees to apply for leaves, HR to review requests, and generate reports.

📌 Features
Employee login & registration

Apply for leave

View leave history

HR leave approval & rejection

Export reports in CSV/PDF format

🛠 Tech Stack
Ruby Version: 3.x (Check with ruby -v)

Rails Version: 7.x (Check with rails -v)

Database: PostgreSQL / MySQL / SQLite

Authentication: Devise

Front-End: ERB, Bootstrap (optional)

Background Jobs: Sidekiq (if applicable)

📌 Installation Steps
Clone the Repository

sh
Copy
Edit
git clone https://github.com/Divyasaxena1609/Leave_Management_App.git
cd Leave_Management_App
Install Dependencies

sh
Copy
Edit
bundle install
Set Up Database

Configure the database in config/database.yml

Run migrations:

sh
Copy
Edit
rails db:create
rails db:migrate
Set Up Environment Variables Create a .env file and add:

ini
Copy
Edit
DATABASE_USERNAME=your_username
DATABASE_PASSWORD=your_password
Run the Server

sh
Copy
Edit
rails server
The app will be available at http://localhost:3000

📌 Usage
Employees can log in, apply for leave, and track status.

HR Managers can approve/reject leave requests and generate reports.

