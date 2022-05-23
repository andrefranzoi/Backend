import { Request, Response } from "express";
import { ListProductsServices } from "../../services/products/ListProductsServices";

class ListProductsControllers {
  async handle(req: Request, res: Response) {
    const listProductsServices = new ListProductsServices();

    const products = await listProductsServices.execute();

    return res.json(products)
  }
}

export { ListProductsControllers }