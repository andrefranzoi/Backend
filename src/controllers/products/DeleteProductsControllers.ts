import { Request, Response } from "express";
import { DeleteProductsServices } from "../../services/products/DeleteProductsServices"

class DeleteProductsControllers {
  async handle(req: Request, res: Response) {
    const deleteProductsServices = new DeleteProductsServices();

    const id = req.body.id;

    console.log('id: ', id)

    const deleteResult = await deleteProductsServices.execute(id);

    return res.json(deleteResult);
  }
}

export { DeleteProductsControllers }