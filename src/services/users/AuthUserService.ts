import { compare } from 'bcryptjs'
import prismaClient from '../../prisma'
import { sign } from 'jsonwebtoken'

interface AuthRequest {
  username: string,
  password: string
}

class AuthUserService {
  async execute({ username, password }: AuthRequest) {
    const user = await prismaClient.users.findFirst({
      where: { username: username }
    })

    if (!user) {
      throw new Error('User or Password incorrect!')
    }

    const passwordMath = await compare(password, user.password)
    if (!passwordMath) {
      throw new Error('User or Password incorrect!')
    }

    //Gera um token JwT e Devolver os dados do usuário logado.
    const token = sign(
      {
        name: user.name,
        username: user.username,
      },
      process.env.JWT_SECRET,
      {
        subject: user.id,
        expiresIn: '30d'
      }
    )

    return {
      id: user.id,
      name: user.name,
      username: user.username,
      token: token
    }
  }
}

export { AuthUserService }