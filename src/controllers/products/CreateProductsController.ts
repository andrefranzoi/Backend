import { Request, Response } from 'express'
import { CreateProductsService } from '../../services/products/CreateProductsService'

class CreateProductsController {
  async handle(req: Request, res: Response) {
    const { name, unity, codbar, costPrice, salePrice, ncm, cest, categoryId, subCategoryId } = req.body;

    const createProductsService = new CreateProductsService();

    const products = await createProductsService.execute({
      name: name,
      unity: unity,
      codbar: codbar,
      costPrice: costPrice,
      salePrice: salePrice,
      ncm: ncm,
      cest: cest,
      categoryId: categoryId,
      subCategoryId: subCategoryId,
    });

    return res.json(products)
  }
}

export { CreateProductsController }