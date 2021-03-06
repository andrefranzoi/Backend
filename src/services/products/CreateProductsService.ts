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
    const product = await prismaclient.product.create({
      data: {
        name: name,
        unity: unity,
        codbar: codbar,
        costPrice: parseFloat(costPrice.toString()),
        salePrice: parseFloat(salePrice.toString()),
        ncm: ncm,
        cest: cest,
        categoryId: categoryId,
        subCategoryId: subCategoryId,
      },
      select: {
        id: true,
        name: true,
        unity: true,
        codbar: true,
        costPrice: true,
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