import { Request, Response } from 'express'
import { CreateProductsService } from '../../services/products/CreateProductsService'

class CreateProductsController {
  async handle(req: Request, res: Response) {
    const createProductsService = new CreateProductsService();

    const products = await createProductsService.execute();

    return res.json(products)
  }
}

export { CreateProductsController }