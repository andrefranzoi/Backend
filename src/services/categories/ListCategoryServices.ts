import prismaClient from '../../prisma';

class ListCategoryServices {
  async execute() {
    const category = await prismaClient.category.findMany({
      select: {
        id: true,
        name: true,
        isActive: true
      }
    });

    return category;
  }
}

export { ListCategoryServices }