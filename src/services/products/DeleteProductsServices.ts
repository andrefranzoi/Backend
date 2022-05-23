import prismaclient from "../../prisma";

interface ProductsRequest {
  id: string;
}

class DeleteProductsServices {
  async execute(id) {
    const deleteProd = await prismaclient.product.delete({
      where: { id: id },
    })
  }
}

export { DeleteProductsServices }