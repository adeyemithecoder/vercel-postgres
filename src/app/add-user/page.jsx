"use client";
import axios from "axios";
import { useState } from "react";

const Home = () => {
  const [username, setUsername] = useState("");
  const [password, setPassword] = useState("");
  const [imageUrl, setImageUrl] = useState("");
  const [teacherOf, setTeacherOf] = useState("");
  const [classes, setClasses] = useState([]);
  const [subjects, setSubjects] = useState([]);

  const handleSubmit = async (e) => {
    e.preventDefault();
    try {
      const { data } = await axios.post("/api/create", {
        username,
        password,
        imageUrl,
        teacherOf,
        classes,
        subjects,
      });
      if (data.status == 409) {
        alert(data.message);
        return;
      }
      console.log(data.message);
      alert(data.message);
    } catch (err) {
      console.log(err);
    }
  };

  return (
    <div>
      <h1>Create User</h1>
      <form onSubmit={handleSubmit}>
        <input
          type='text'
          placeholder='Username'
          value={username}
          onChange={(e) => setUsername(e.target.value)}
          required
        />
        <input
          type='password'
          placeholder='Password'
          value={password}
          onChange={(e) => setPassword(e.target.value)}
          required
        />
        <input
          type='text'
          placeholder='Image URL'
          value={imageUrl}
          onChange={(e) => setImageUrl(e.target.value)}
        />
        <input
          type='text'
          placeholder='Teacher Of'
          value={teacherOf}
          onChange={(e) => setTeacherOf(e.target.value)}
        />
        <input
          type='text'
          placeholder='Classes (comma separated)'
          value={classes}
          onChange={(e) => setClasses(e.target.value.split(","))}
        />
        <input
          type='text'
          placeholder='Subjects (comma separated)'
          value={subjects}
          onChange={(e) => setSubjects(e.target.value.split(","))}
        />
        <button type='submit'>Create User</button>
      </form>
    </div>
  );
};

export default Home;
