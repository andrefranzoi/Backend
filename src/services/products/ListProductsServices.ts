import prismaclient from "../../prisma";

class ListProductsServices {
  async execute() {
    const listProducts = await prismaclient.product.findMany({
      select: {
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
    });
    return listProducts
  }
}


export { ListProductsServices }