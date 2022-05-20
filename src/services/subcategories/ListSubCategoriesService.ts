import prismaClient from '../../prisma';

class ListSubCategoriesService {
  async execute() {
    const subCategory = await prismaClient.subCategory.findMany({
      select: {
        id: true,
        name: true,
        isActive: false
      }
    });

    return subCategory;
  }
}

export { ListSubCategoriesService }