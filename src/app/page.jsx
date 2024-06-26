"use client";
import axios from "axios";
import { useEffect, useState } from "react";

const UserList = () => {
  const [users, setUsers] = useState([]);

  useEffect(() => {
    const fetchUsers = async () => {
      try {
        const res = await axios.get("/api/create"); // Assuming your endpoint to fetch users is '/api/users'
        setUsers(res.data); // Assuming 'res.data' contains the array of user objects
      } catch (error) {
        console.error("Error fetching users:", error);
      }
    };
    fetchUsers();
  }, []);

  return (
    <div>
      <h1>User List</h1>
      <ul>
        {users.map((user) => (
          <li key={user.id}>
            <strong>Username:</strong> {user.username} <br />
            <strong>Teacher Of:</strong> {user.teacherOf} <br />
            <strong>Classes:</strong> {user.classes.join(", ")} <br />
            <strong>Subjects:</strong> {user.subjects.join(", ")} <br />
            <strong>Role:</strong> {user.role} <br />
            <strong>Created At:</strong>{" "}
            {new Date(user.createdAt).toLocaleString()} <br />
            <strong>Updated At:</strong>{" "}
            {new Date(user.updatedAt).toLocaleString()} <br />
          </li>
        ))}
      </ul>
    </div>
  );
};

export default UserList;
