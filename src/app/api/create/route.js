import { PrismaClient } from "@prisma/client";
import { NextResponse } from "next/server";

const prisma = new PrismaClient();
// export default async function handler(req, res) {
//   console.log(req.body);
//   if (req.method === "GET") {
//     const users = await prisma.user.findMany();
//     res.status(200).json(users);
//   } else if (req.method === "POST") {
//     const { email, name } = req.body;
//     const newUser = await prisma.user.create({
//       data: {
//         email,
//         name,
//       },
//     });
//     res.status(201).json(newUser);
//   } else {
//     res.setHeader("Allow", ["GET", "POST"]);
//     res.status(405).end(`Method ${req.method} Not Allowed`);
//   }
// }
export async function POST(request) {
  const body = await request.json();
  const { email, name } = body;
  const user = await prisma.user.create({
    data: { email, name },
  });
  return NextResponse.json(user, { status: 201 });
}

export async function GET(request) {
  const allUsers = await prisma.user.findMany();
  return NextResponse.json(allUsers, { status: 200 });
}
