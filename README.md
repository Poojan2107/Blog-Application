# Blog App

A full-stack MERN blog application with user authentication and CRUD operations for blog posts.

## Features

- User registration and login with JWT authentication
- Create, read, update, and delete blog posts
- User-specific blog management (users can only edit/delete their own blogs)
- Responsive UI with React frontend
- MongoDB database for data persistence
- Express.js backend with RESTful API

## Tech Stack

### Frontend
- React.js
- React Router for navigation
- Axios for API calls
- CSS for styling

### Backend
- Node.js
- Express.js
- MongoDB with Mongoose
- JWT for authentication
- bcryptjs for password hashing

## Getting Started

### Prerequisites
- Node.js (v14 or higher)
- MongoDB (local or cloud instance)
- npm or yarn

### Installation

1. Clone the repository:
```bash
git clone <repository-url>
cd blog-app
```

2. Install dependencies for both frontend and backend:
```bash
npm install
cd backend && npm install
cd ../frontend && npm install
```

3. Create a `.env` file in the backend directory with the following variables:
```
MONGO_URI=your_mongodb_connection_string
JWT_SECRET=your_jwt_secret_key
PORT=5000
```

4. Start the application:
```bash
# From the root directory
npm start
```

This will start both the backend server (port 5000) and frontend development server (port 3000) concurrently.

## API Endpoints

### Authentication
- `POST /api/auth/register` - Register a new user
- `POST /api/auth/login` - Login user
- `GET /api/auth/profile` - Get user profile (protected)

### Blogs
- `GET /api/blogs` - Get all blogs (public) or user's blogs (authenticated)
- `GET /api/blogs/:id` - Get single blog by ID
- `POST /api/blogs` - Create new blog (protected)
- `PUT /api/blogs/:id` - Update blog (protected, author only)
- `DELETE /api/blogs/:id` - Delete blog (protected, author only)

## Usage

1. Register a new account or login with existing credentials
2. View all blogs on the home page
3. Access your dashboard to manage your own blogs
4. Create new blog posts
5. Edit or delete your existing posts
6. View detailed blog posts

## Project Structure

```
blog-app/
├── backend/
│   ├── middleware/
│   │   └── auth.js
│   ├── models/
│   │   ├── User.js
│   │   └── Blog.js
│   ├── routes/
│   │   ├── auth.js
│   │   └── blogs.js
│   ├── package.json
│   └── server.js
├── frontend/
│   ├── public/
│   │   └── index.html
│   ├── src/
│   │   ├── components/
│   │   │   ├── AddBlog.js
│   │   │   ├── BlogDetail.js
│   │   │   ├── BlogList.js
│   │   │   ├── Dashboard.js
│   │   │   ├── Login.js
│   │   │   ├── Navbar.js
│   │   │   └── Register.js
│   │   ├── App.css
│   │   ├── App.js
│   │   ├── index.css
│   │   └── index.js
│   └── package.json
├── package.json
├── README.md
└── .env
```
