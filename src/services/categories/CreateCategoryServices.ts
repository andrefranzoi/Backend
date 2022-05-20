import prismaClient from "../../prisma";

interface CategoryRequest {
  name: string;
}

class CreateCategoryServices {
  async execute({ name }: CategoryRequest) {
    if (!name) {
      throw new Error("Name is incorrect")
    }

    const category = await prismaClient.category.create({
      data: {
        name: name
      },
      select: {
        name: true,
      }
    })
    return category
  }
}

export { CreateCategoryServices }