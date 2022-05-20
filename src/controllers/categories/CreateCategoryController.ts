import { Request, Response } from 'express'
import { CreateCategoryServices } from '../../services/categories/CreateCategoryServices'

class CreateCategoryController {
  async handle(req: Request, res: Response) {
    const name = req.body.name
    const createCategoryServices = new CreateCategoryServices();

    const category = await createCategoryServices.execute({
      name: name,
    });

    return res.json(category);
  }
}

export { CreateCategoryController }