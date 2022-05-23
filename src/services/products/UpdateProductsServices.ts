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
  id: string;
  isActive: boolean;
}

class UpdateProductsServices {
  async execute({ name, unity, codbar, costPrice, salePrice, ncm, cest, categoryId, subCategoryId, id, isActive }: ProductRequest) {
    const product = await prismaclient.product.update({
      where: {
        id: id
      },
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
        isActive: isActive,
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

export { UpdateProductsServices }