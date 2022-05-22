/*
  Warnings:

  - You are about to drop the column `anpId` on the `products` table. All the data in the column will be lost.
  - You are about to drop the column `banner` on the `products` table. All the data in the column will be lost.
  - You are about to drop the column `codManufacturer` on the `products` table. All the data in the column will be lost.
  - You are about to drop the column `cofins` on the `products` table. All the data in the column will be lost.
  - You are about to drop the column `company` on the `products` table. All the data in the column will be lost.
  - You are about to drop the column `csosnIcmsId` on the `products` table. All the data in the column will be lost.
  - You are about to drop the column `cstCofinsId` on the `products` table. All the data in the column will be lost.
  - You are about to drop the column `cstIcmsId` on the `products` table. All the data in the column will be lost.
  - You are about to drop the column `cstIpiId` on the `products` table. All the data in the column will be lost.
  - You are about to drop the column `cstPisId` on the `products` table. All the data in the column will be lost.
  - You are about to drop the column `dateLastPurchase` on the `products` table. All the data in the column will be lost.
  - You are about to drop the column `dateLastSale` on the `products` table. All the data in the column will be lost.
  - You are about to drop the column `description` on the `products` table. All the data in the column will be lost.
  - You are about to drop the column `detail` on the `products` table. All the data in the column will be lost.
  - You are about to drop the column `extIpi` on the `products` table. All the data in the column will be lost.
  - You are about to drop the column `icms` on the `products` table. All the data in the column will be lost.
  - You are about to drop the column `ipi` on the `products` table. All the data in the column will be lost.
  - You are about to drop the column `isBalance` on the `products` table. All the data in the column will be lost.
  - You are about to drop the column `maximumStock` on the `products` table. All the data in the column will be lost.
  - You are about to drop the column `minimumStock` on the `products` table. All the data in the column will be lost.
  - You are about to drop the column `netWeight` on the `products` table. All the data in the column will be lost.
  - You are about to drop the column `numCest` on the `products` table. All the data in the column will be lost.
  - You are about to drop the column `numNcm` on the `products` table. All the data in the column will be lost.
  - You are about to drop the column `pis` on the `products` table. All the data in the column will be lost.
  - You are about to drop the column `profitMargin` on the `products` table. All the data in the column will be lost.
  - You are about to drop the column `provider` on the `products` table. All the data in the column will be lost.
  - You are about to drop the column `references` on the `products` table. All the data in the column will be lost.
  - You are about to drop the column `shippingPercen` on the `products` table. All the data in the column will be lost.
  - You are about to drop the column `sourceId` on the `products` table. All the data in the column will be lost.
  - You are about to drop the column `stockBalance` on the `products` table. All the data in the column will be lost.
  - You are about to drop the column `weight` on the `products` table. All the data in the column will be lost.
  - You are about to drop the `anp` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `csosnIcms` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `cstCofins` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `cstIcms` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `cstIpi` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `cstPis` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `ncm` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `source` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `Cest` to the `products` table without a default value. This is not possible if the table is not empty.
  - Added the required column `Ncm` to the `products` table without a default value. This is not possible if the table is not empty.
  - Added the required column `name` to the `products` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "products" DROP CONSTRAINT "products_anpId_fkey";

-- DropForeignKey
ALTER TABLE "products" DROP CONSTRAINT "products_categoryId_fkey";

-- DropForeignKey
ALTER TABLE "products" DROP CONSTRAINT "products_csosnIcmsId_fkey";

-- DropForeignKey
ALTER TABLE "products" DROP CONSTRAINT "products_cstCofinsId_fkey";

-- DropForeignKey
ALTER TABLE "products" DROP CONSTRAINT "products_cstIcmsId_fkey";

-- DropForeignKey
ALTER TABLE "products" DROP CONSTRAINT "products_cstIpiId_fkey";

-- DropForeignKey
ALTER TABLE "products" DROP CONSTRAINT "products_cstPisId_fkey";

-- DropForeignKey
ALTER TABLE "products" DROP CONSTRAINT "products_sourceId_fkey";

-- DropForeignKey
ALTER TABLE "products" DROP CONSTRAINT "products_subCategoryId_fkey";

-- AlterTable
ALTER TABLE "products" DROP COLUMN "anpId",
DROP COLUMN "banner",
DROP COLUMN "codManufacturer",
DROP COLUMN "cofins",
DROP COLUMN "company",
DROP COLUMN "csosnIcmsId",
DROP COLUMN "cstCofinsId",
DROP COLUMN "cstIcmsId",
DROP COLUMN "cstIpiId",
DROP COLUMN "cstPisId",
DROP COLUMN "dateLastPurchase",
DROP COLUMN "dateLastSale",
DROP COLUMN "description",
DROP COLUMN "detail",
DROP COLUMN "extIpi",
DROP COLUMN "icms",
DROP COLUMN "ipi",
DROP COLUMN "isBalance",
DROP COLUMN "maximumStock",
DROP COLUMN "minimumStock",
DROP COLUMN "netWeight",
DROP COLUMN "numCest",
DROP COLUMN "numNcm",
DROP COLUMN "pis",
DROP COLUMN "profitMargin",
DROP COLUMN "provider",
DROP COLUMN "references",
DROP COLUMN "shippingPercen",
DROP COLUMN "sourceId",
DROP COLUMN "stockBalance",
DROP COLUMN "weight",
ADD COLUMN     "Cest" CHAR(7) NOT NULL,
ADD COLUMN     "Ncm" CHAR(8) NOT NULL,
ADD COLUMN     "name" TEXT NOT NULL,
ALTER COLUMN "categoryId" DROP NOT NULL,
ALTER COLUMN "subCategoryId" DROP NOT NULL,
ALTER COLUMN "costPrice" SET DEFAULT 0.00,
ALTER COLUMN "salePrice" SET DEFAULT 0.00;

-- DropTable
DROP TABLE "anp";

-- DropTable
DROP TABLE "csosnIcms";

-- DropTable
DROP TABLE "cstCofins";

-- DropTable
DROP TABLE "cstIcms";

-- DropTable
DROP TABLE "cstIpi";

-- DropTable
DROP TABLE "cstPis";

-- DropTable
DROP TABLE "ncm";

-- DropTable
DROP TABLE "source";

-- AddForeignKey
ALTER TABLE "products" ADD CONSTRAINT "products_categoryId_fkey" FOREIGN KEY ("categoryId") REFERENCES "categories"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "products" ADD CONSTRAINT "products_subCategoryId_fkey" FOREIGN KEY ("subCategoryId") REFERENCES "subCategories"("id") ON DELETE SET NULL ON UPDATE CASCADE;
