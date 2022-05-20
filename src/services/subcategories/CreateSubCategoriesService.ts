import prismaClient from "../../prisma";

interface SubCategoryRequest {
  name: string;
}

class CreateSubCategoriesService {
  async execute({ name }: SubCategoryRequest) {
    if (!name) {
      throw new Error("Name is incorrect")
    }

    const subCategory = await prismaClient.subCategory.create({
      data: {
        name: name,
      },
      select: {
        id: true,
        name: true,
        isActive: true,
      }
    })

    return subCategory
  }
}

export { CreateSubCategoriesService }