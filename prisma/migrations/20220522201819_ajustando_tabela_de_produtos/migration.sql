/*
  Warnings:

  - You are about to drop the column `Cest` on the `products` table. All the data in the column will be lost.
  - You are about to drop the column `Ncm` on the `products` table. All the data in the column will be lost.
  - You are about to drop the column `scale` on the `products` table. All the data in the column will be lost.
  - Added the required column `cest` to the `products` table without a default value. This is not possible if the table is not empty.
  - Added the required column `ncm` to the `products` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "products" DROP COLUMN "Cest",
DROP COLUMN "Ncm",
DROP COLUMN "scale",
ADD COLUMN     "cest" CHAR(7) NOT NULL,
ADD COLUMN     "ncm" CHAR(8) NOT NULL;
