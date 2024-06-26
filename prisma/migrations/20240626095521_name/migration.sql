/*
  Warnings:

  - You are about to drop the column `email` on the `User` table. All the data in the column will be lost.
  - You are about to drop the column `name` on the `User` table. All the data in the column will be lost.
  - Added the required column `password` to the `User` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updatedAt` to the `User` table without a default value. This is not possible if the table is not empty.
  - Added the required column `username` to the `User` table without a default value. This is not possible if the table is not empty.

*/
-- CreateEnum
CREATE TYPE "Role" AS ENUM ('ADMIN', 'USER');

-- DropIndex
DROP INDEX "User_email_key";

-- AlterTable
ALTER TABLE "User" DROP COLUMN "email",
DROP COLUMN "name",
ADD COLUMN     "classes" TEXT[] DEFAULT ARRAY[]::TEXT[],
ADD COLUMN     "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "imageUrl" TEXT DEFAULT '',
ADD COLUMN     "password" TEXT NOT NULL,
ADD COLUMN     "role" "Role" NOT NULL DEFAULT 'USER',
ADD COLUMN     "subjects" TEXT[] DEFAULT ARRAY[]::TEXT[],
ADD COLUMN     "teacherOf" TEXT DEFAULT '',
ADD COLUMN     "updatedAt" TIMESTAMP(3) NOT NULL,
ADD COLUMN     "username" TEXT NOT NULL;

-- CreateTable
CREATE TABLE "Student23" (
    "id" SERIAL NOT NULL,
    "level" TEXT NOT NULL,
    "variant" TEXT,
    "gender" TEXT,
    "password" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "username" TEXT NOT NULL,
    "surname" TEXT NOT NULL,
    "attendanceId" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Student23_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Student24" (
    "id" SERIAL NOT NULL,
    "level" TEXT NOT NULL,
    "variant" TEXT,
    "gender" TEXT,
    "password" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "username" TEXT NOT NULL,
    "surname" TEXT NOT NULL,
    "attendanceId" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Student24_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Attendance" (
    "id" SERIAL NOT NULL,
    "totalPresent" INTEGER NOT NULL DEFAULT 0,
    "totalAbsent" INTEGER NOT NULL DEFAULT 0,
    "presentDates" TIMESTAMP(3)[],
    "absentDates" TIMESTAMP(3)[],

    CONSTRAINT "Attendance_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "TimeTable" (
    "id" SERIAL NOT NULL,
    "level" TEXT NOT NULL,
    "subject" TEXT NOT NULL,
    "time" TEXT NOT NULL,
    "date" TEXT NOT NULL,

    CONSTRAINT "TimeTable_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ThirdTerms23" (
    "id" SERIAL NOT NULL,
    "studentId" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "ThirdTerms23_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "FirstTerms24" (
    "id" SERIAL NOT NULL,
    "studentId" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "FirstTerms24_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Subject" (
    "id" SERIAL NOT NULL,
    "subjectName" TEXT NOT NULL,
    "firstCA" INTEGER,
    "secondCA" INTEGER,
    "project" INTEGER,
    "assignment" INTEGER,
    "exam" INTEGER,
    "thirdTerms23Id" INTEGER,
    "firstTerms24Id" INTEGER,

    CONSTRAINT "Subject_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Student23_username_key" ON "Student23"("username");

-- CreateIndex
CREATE UNIQUE INDEX "Student24_username_key" ON "Student24"("username");

-- CreateIndex
CREATE INDEX "studentId23" ON "ThirdTerms23"("studentId");

-- CreateIndex
CREATE INDEX "studentId24" ON "FirstTerms24"("studentId");

-- AddForeignKey
ALTER TABLE "Student23" ADD CONSTRAINT "Student23_attendanceId_fkey" FOREIGN KEY ("attendanceId") REFERENCES "Attendance"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Student24" ADD CONSTRAINT "Student24_attendanceId_fkey" FOREIGN KEY ("attendanceId") REFERENCES "Attendance"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Subject" ADD CONSTRAINT "Subject_thirdTerms23Id_fkey" FOREIGN KEY ("thirdTerms23Id") REFERENCES "ThirdTerms23"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Subject" ADD CONSTRAINT "Subject_firstTerms24Id_fkey" FOREIGN KEY ("firstTerms24Id") REFERENCES "FirstTerms24"("id") ON DELETE SET NULL ON UPDATE CASCADE;
