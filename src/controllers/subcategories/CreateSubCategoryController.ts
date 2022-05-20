import { Request, Response } from "express";
import { CreateSubCategoriesService } from "../../services/subcategories/CreateSubCategoriesService"

class CreateSubCategoryController {
  async handle(req: Request, res: Response) {
    const name = req.body.name;

    const createSubCategoriesService = new CreateSubCategoriesService();

    const subCategory = await createSubCategoriesService.execute(
      { name }
    );

    return res.json(subCategory)
  }
}

export { CreateSubCategoryController }