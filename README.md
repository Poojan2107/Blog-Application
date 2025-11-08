# MERN Blog Application

A full-stack blog application built with the MERN stack (MongoDB, Express.js, React, Node.js). Features JWT authentication, CRUD operations for blogs, and a clean black-and-white UI.

## Features

- **User Authentication**: Register and login with JWT tokens
- **Blog Management**: Create, read, update, and delete blog posts
- **Dashboard**: View and manage your own blogs
- **Public Blog List**: Browse all published blogs
- **Responsive Design**: Clean, professional black-and-white interface
- **Secure API**: Protected routes with authentication middleware

## Tech Stack

### Backend
- **Node.js** - Runtime environment
- **Express.js** - Web framework
- **MongoDB** - NoSQL database
- **Mongoose** - ODM for MongoDB
- **JWT** - JSON Web Tokens for authentication
- **bcryptjs** - Password hashing

### Frontend
- **React** - UI library
- **React Router** - Client-side routing
- **Axios** - HTTP client
- **CSS** - Styling (black and white theme)

## Project Structure

```
blog-app/
├── backend/
│   ├── models/
│   │   ├── User.js
│   │   └── Blog.js
│   ├── routes/
│   │   ├── auth.js
│   │   └── blogs.js
│   ├── middleware/
│   │   └── auth.js
│   ├── server.js
│   └── package.json
├── frontend/
│   ├── public/
│   ├── src/
│   │   ├── components/
│   │   │   ├── Navbar.js
│   │   │   ├── Login.js
│   │   │   ├── Register.js
│   │   │   ├── Dashboard.js
│   │   │   ├── AddBlog.js
│   │   │   ├── BlogList.js
│   │   │   └── BlogDetail.js
│   │   ├── App.js
│   │   ├── index.js
│   │   └── index.css
│   └── package.json
├── package.json
└── README.md
```

## Prerequisites

- Node.js (v14 or higher)
- MongoDB (local installation or cloud service like MongoDB Atlas)
- npm or yarn

## Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd blog-app
   ```

2. **Install dependencies**
   ```bash
   npm run install-all
   ```

3. **Environment Setup**
   - Create a `.env` file in the `backend` directory
   - Add your MongoDB connection string:
     ```
     MONGO_URI=mongodb://localhost:27017/blog-app
     JWT_SECRET=your-secret-key-here
     ```

## Running the Application

### Development Mode
```bash
npm run dev
```
This will start both backend (with nodemon) and frontend servers concurrently.

### Production Mode
```bash
npm start
```
This will start both backend and frontend servers concurrently.

### Manual Start
You can also start them separately:

**Backend:**
```bash
cd backend
npm start
```

**Frontend:**
```bash
cd frontend
npm start
```

## API Endpoints

### Authentication
- `POST /api/auth/register` - Register a new user
- `POST /api/auth/login` - Login user
- `GET /api/auth/profile` - Get user profile (protected)

### Blogs
- `GET /api/blogs` - Get all blogs
- `GET /api/blogs/:id` - Get single blog
- `POST /api/blogs` - Create new blog (protected)
- `PUT /api/blogs/:id` - Update blog (protected, author only)
- `DELETE /api/blogs/:id` - Delete blog (protected, author only)

## Usage

1. **Register**: Create a new account
2. **Login**: Sign in with your credentials
3. **Dashboard**: View and manage your blogs
4. **Add Blog**: Create new blog posts
5. **Blog List**: Browse all blogs
6. **Edit/Delete**: Modify your own posts

## Security Features

- Password hashing with bcryptjs
- JWT token-based authentication
- Protected routes middleware
- Author-only blog modifications

## UI Design

- **Color Scheme**: Strict black and white
- **Typography**: Clean, readable fonts
- **Layout**: Responsive design with proper spacing
- **Components**: Card-based layout with subtle shadows

## Contributing

1. Fork the repository
2. Create a feature branch
3. Commit your changes
4. Push to the branch
5. Open a Pull Request

## License

This project is licensed under the ISC License.

## Support

For questions or issues, please open an issue in the repository.
