import { Request, Response } from "express"
import { UpdateProductsServices } from '../../services/products/UpdateProductsServices'

class UpdateProductsControllers {
  async handle(req: Request, res: Response) {
    const { name, unity, codbar, costPrice, salePrice, ncm, cest, categoryId, subCategoryId, id, isActive } = req.body;

    const updateProductsServices = new UpdateProductsServices();

    const updateProducts = await updateProductsServices.execute({
      name: name,
      unity: unity,
      codbar: codbar,
      costPrice: costPrice,
      salePrice: salePrice,
      ncm: ncm,
      cest: cest,
      categoryId: categoryId,
      subCategoryId: subCategoryId,
      id: id,
      isActive: isActive
    });

    return res.json(updateProducts)
  }

}

export { UpdateProductsControllers }