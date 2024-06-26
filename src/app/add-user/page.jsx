"use client";
import axios from "axios";
import { useState } from "react";

export default function AddUser() {
  const [email, setEmail] = useState("");
  const [name, setName] = useState("");

  console.log("object");

  const handleSubmit = async (e) => {
    e.preventDefault();
    const res = await axios.post("/api/create", { email, name });
    console.log("res=", res);
    if (res.status == "201") {
      alert("User added successfully");
      setEmail("");
      setName("");
    } else {
      alert("Error adding user");
    }
  };

  return (
    <form onSubmit={handleSubmit}>
      <div>
        <label>Email:</label>
        <input
          type='email'
          value={email}
          onChange={(e) => setEmail(e.target.value)}
          required
        />
      </div>
      <div>
        <label>Name:</label>
        <input
          type='text'
          value={name}
          onChange={(e) => setName(e.target.value)}
          required
        />
      </div>
      <button type='submit'>Add User</button>
    </form>
  );
}
