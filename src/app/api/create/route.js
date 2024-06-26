import { PrismaClient } from "@prisma/client";
import { NextResponse } from "next/server";

const prisma = new PrismaClient();

export async function POST(req) {
  const body = await req.json();
  const { username, password, imageUrl, teacherOf, classes, subjects } = body;

  try {
    // Check if the username already exists
    const existingUser = await prisma.user.findUnique({
      where: {
        username,
      },
    });
    if (existingUser) {
      return new NextResponse(
        JSON.stringify({
          message: `User with ${existingUser.username} already exist.`,
          status: 409,
        })
      );
    }
    // Create a new user if the username is unique
    const newUser = await prisma.user.create({
      data: {
        username,
        password,
        imageUrl,
        teacherOf,
        classes: { set: classes },
        subjects: { set: subjects },
      },
    });
    return new NextResponse(
      JSON.stringify({
        message: "User created successfully!",
        status: 201,
      })
    );
  } catch (error) {
    // Handle other errors gracefully
    console.error("Error creating user:", error);
    return NextResponse.json(
      { error: "Failed to create user" },
      { status: 500 }
    );
  }
}

// export async function POST(request) {
//   const body = await request.json();
//   const { email, name } = body;
//   const user = await prisma.user.create({
//     data: { email, name },
//   });
//   return NextResponse.json(user, { status: 201 });
// }

export async function GET(request) {
  const allUsers = await prisma.user.findMany();
  return NextResponse.json(allUsers, { status: 200 });
}
