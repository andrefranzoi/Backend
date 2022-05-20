import prismaClient from "../../prisma";

class CreateProductsService {
  async execute() {
    return { ok: true }
  }
}

export { CreateProductsService }