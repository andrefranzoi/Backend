import { Request, Response } from "express";
import { ListSubCategoriesService } from '../../services/subcategories/ListSubCategoriesService'

class ListSubCategoryController {
  async handle(req: Request, res: Response) {
    const listSubCateforyService = new ListSubCategoriesService();

    const subCategory = await listSubCateforyService.execute();

    return res.json(subCategory)
  }
}

export { ListSubCategoryController }