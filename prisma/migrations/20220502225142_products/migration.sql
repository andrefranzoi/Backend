-- CreateTable
CREATE TABLE "users" (
    "id" TEXT NOT NULL,
    "name" VARCHAR(100) NOT NULL,
    "emails" VARCHAR(200) NOT NULL,
    "usernames" VARCHAR(60) NOT NULL,
    "office" VARCHAR(80) NOT NULL,
    "isActive" BOOLEAN NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "roleId" TEXT,

    CONSTRAINT "users_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "roles" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "isAdmin" BOOLEAN NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "roles_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "products" (
    "id" TEXT NOT NULL,
    "references" VARCHAR(30) NOT NULL,
    "company" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "unity" VARCHAR(12) NOT NULL,
    "codbar" CHAR(13) NOT NULL,
    "isBalance" BOOLEAN NOT NULL,
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "categoryId" TEXT NOT NULL,
    "subCategoryId" TEXT NOT NULL,
    "codManufacturer" VARCHAR(30) NOT NULL,
    "provider" TEXT NOT NULL,
    "costPrice" DOUBLE PRECISION NOT NULL,
    "salePrice" DOUBLE PRECISION NOT NULL,
    "profitMargin" DOUBLE PRECISION NOT NULL,
    "minimumStock" DOUBLE PRECISION NOT NULL,
    "maximumStock" DOUBLE PRECISION NOT NULL,
    "stockBalance" DOUBLE PRECISION NOT NULL,
    "numNcm" CHAR(8) NOT NULL,
    "numCest" CHAR(7) NOT NULL,
    "sourceId" TEXT NOT NULL,
    "cstIcmsId" TEXT NOT NULL,
    "csosnIcmsId" TEXT NOT NULL,
    "anpId" TEXT NOT NULL,
    "scale" CHAR(1) NOT NULL,
    "cstIpiId" TEXT NOT NULL,
    "cstPisId" TEXT NOT NULL,
    "cstCofinsId" TEXT NOT NULL,
    "icms" DOUBLE PRECISION NOT NULL,
    "extIpi" TEXT NOT NULL,
    "ipi" DOUBLE PRECISION NOT NULL,
    "pis" DOUBLE PRECISION NOT NULL,
    "cofins" TEXT NOT NULL,
    "shippingPercen" DOUBLE PRECISION NOT NULL,
    "dateLastPurchase" TIMESTAMP(3) NOT NULL,
    "dateLastSale" TIMESTAMP(3) NOT NULL,
    "weight" DOUBLE PRECISION NOT NULL,
    "netWeight" DOUBLE PRECISION NOT NULL,
    "detail" TEXT NOT NULL,
    "banner" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "products_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "categories" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "categories_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "subCategories" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "subCategories_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ncm" (
    "id" TEXT NOT NULL,
    "Cest" CHAR(7) NOT NULL,
    "codigo" CHAR(8) NOT NULL,
    "descricao" TEXT NOT NULL,
    "isActive" BOOLEAN NOT NULL,

    CONSTRAINT "ncm_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "source" (
    "id" TEXT NOT NULL,
    "name" VARCHAR(200) NOT NULL,
    "isActive" BOOLEAN NOT NULL,

    CONSTRAINT "source_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "cstIcms" (
    "id" TEXT NOT NULL,
    "name" VARCHAR(200) NOT NULL,

    CONSTRAINT "cstIcms_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "csosnIcms" (
    "id" TEXT NOT NULL,
    "name" VARCHAR(200) NOT NULL,
    "cstList" TEXT NOT NULL,

    CONSTRAINT "csosnIcms_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "anp" (
    "id" TEXT NOT NULL,
    "name" VARCHAR(200) NOT NULL,

    CONSTRAINT "anp_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "cstIpi" (
    "id" TEXT NOT NULL,
    "name" VARCHAR(200) NOT NULL,
    "type" CHAR(1) NOT NULL,

    CONSTRAINT "cstIpi_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "cstPis" (
    "id" TEXT NOT NULL,
    "name" VARCHAR(200) NOT NULL,

    CONSTRAINT "cstPis_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "cstCofins" (
    "id" TEXT NOT NULL,
    "name" VARCHAR(200) NOT NULL,

    CONSTRAINT "cstCofins_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "users_emails_key" ON "users"("emails");

-- CreateIndex
CREATE UNIQUE INDEX "products_codbar_key" ON "products"("codbar");

-- CreateIndex
CREATE UNIQUE INDEX "categories_name_key" ON "categories"("name");

-- CreateIndex
CREATE UNIQUE INDEX "subCategories_name_key" ON "subCategories"("name");

-- AddForeignKey
ALTER TABLE "users" ADD CONSTRAINT "users_roleId_fkey" FOREIGN KEY ("roleId") REFERENCES "roles"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "products" ADD CONSTRAINT "products_categoryId_fkey" FOREIGN KEY ("categoryId") REFERENCES "categories"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "products" ADD CONSTRAINT "products_subCategoryId_fkey" FOREIGN KEY ("subCategoryId") REFERENCES "subCategories"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "products" ADD CONSTRAINT "products_sourceId_fkey" FOREIGN KEY ("sourceId") REFERENCES "source"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "products" ADD CONSTRAINT "products_cstIcmsId_fkey" FOREIGN KEY ("cstIcmsId") REFERENCES "cstIcms"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "products" ADD CONSTRAINT "products_csosnIcmsId_fkey" FOREIGN KEY ("csosnIcmsId") REFERENCES "csosnIcms"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "products" ADD CONSTRAINT "products_anpId_fkey" FOREIGN KEY ("anpId") REFERENCES "anp"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "products" ADD CONSTRAINT "products_cstIpiId_fkey" FOREIGN KEY ("cstIpiId") REFERENCES "cstIpi"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "products" ADD CONSTRAINT "products_cstPisId_fkey" FOREIGN KEY ("cstPisId") REFERENCES "cstPis"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "products" ADD CONSTRAINT "products_cstCofinsId_fkey" FOREIGN KEY ("cstCofinsId") REFERENCES "cstCofins"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
