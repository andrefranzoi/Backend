import { hash } from 'bcryptjs';
import prismaClient from '../../prisma';

interface UsersRequest {
  name: string
  email: string
  username: string
  password: string
  office: string
}

class CreateUserService {
  async execute({ name, email, username, password, office }: UsersRequest) {
    if (!email) {
      throw new Error("Email is incorrect")
    }
    if (!username) {
      throw new Error("Username is incorrect")
    }

    const userEmailAlreadyExists = await prismaClient.users.findFirst({
      where: { email: email }
    })

    const userUserNameAlreadyExists = await prismaClient.users.findFirst({
      where: { username: username }
    })

    if (userEmailAlreadyExists || userUserNameAlreadyExists) {
      throw new Error("User already exists")
    }

    const passwordHash = await hash(password, 8)

    const user = await prismaClient.users.create({
      data: {
        name: name,
        email: email,
        username: username,
        password: passwordHash,
        office: office
      },
      select: {
        id: true,
        name: true,
        email: true,
        office: true
      }
    })
    return user
  }
}

export { CreateUserService }