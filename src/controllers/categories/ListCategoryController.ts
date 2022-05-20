import { Request, Response } from "express";
import { ListCategoryServices } from '../../services/categories/ListCategoryServices'

class ListCategoryController {
  async handle(req: Request, res: Response) {
    const listCateforyService = new ListCategoryServices();

    const category = await listCateforyService.execute();

    return res.json(category)
  }
}

export { ListCategoryController }