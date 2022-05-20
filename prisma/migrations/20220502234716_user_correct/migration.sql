/*
  Warnings:

  - You are about to drop the column `emails` on the `users` table. All the data in the column will be lost.
  - You are about to drop the column `pasword` on the `users` table. All the data in the column will be lost.
  - You are about to drop the column `usernames` on the `users` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[email]` on the table `users` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `email` to the `users` table without a default value. This is not possible if the table is not empty.
  - Added the required column `password` to the `users` table without a default value. This is not possible if the table is not empty.
  - Added the required column `username` to the `users` table without a default value. This is not possible if the table is not empty.

*/
-- DropIndex
DROP INDEX "users_emails_key";

-- AlterTable
ALTER TABLE "users" DROP COLUMN "emails",
DROP COLUMN "pasword",
DROP COLUMN "usernames",
ADD COLUMN     "email" VARCHAR(200) NOT NULL,
ADD COLUMN     "password" TEXT NOT NULL,
ADD COLUMN     "username" VARCHAR(60) NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX "users_email_key" ON "users"("email");
