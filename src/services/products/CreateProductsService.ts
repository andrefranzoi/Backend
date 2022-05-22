import prismaclient from "../../prisma";

interface ProductRequest {
  name: string;
  unity: string;
  codbar: string;
  costPrice: number;
  salePrice: number;
  ncm: string;
  cest: string;
  categoryId: string;
  subCategoryId: string;
}

class CreateProductsService {
  async execute({ name, unity, codbar, costPrice, salePrice, ncm, cest, categoryId, subCategoryId }: ProductRequest) {
    const product = await prismaclient.products.create({
      data: {
        name: name,
        unity: unity,
        codbar: codbar,
        costprice: parseFloat(costPrice.toString()),
        salePrice: parseFloat(salePrice.toString()),
        ncm: ncm,
        cest: cest,
        categoryId: categoryId,
        subCategoryId: subCategoryId,
      },
      select: {
        name: true,
        unity: true,
        codbar: true,
        costprice: true,
        salePrice: true,
        ncm: true,
        cest: true,
        categoryId: true,
        subCategoryId: true,
      }
    })
    return product
  }
}

export { CreateProductsService }