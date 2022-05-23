import { Router, Response, Request } from "express";

//USERS
import { CreateUserController } from "./controllers/users/CreateUserController";
import { AuthUserController } from "./controllers/users/AuthUserController";
import { DetailUserController } from "./controllers/users/DetailUserController";

//PRODUTOS
import { CreateProductsController } from "./controllers/products/CreateProductsController";
import { ListProductsControllers } from "./controllers/products/ListProductsControllers";
import { UpdateProductsControllers } from "./controllers/products/UpdateProductsControllers";
import { DeleteProductsControllers } from "./controllers/products/DeleteProductsControllers"

//CATEGORIAS
import { CreateCategoryController } from './controllers/categories/CreateCategoryController';
import { ListCategoryController } from './controllers/categories/ListCategoryController';

//SUB-CATEGORIAS
import { CreateSubCategoryController } from './controllers/subcategories/CreateSubCategoryController';
import { ListSubCategoryController } from './controllers/subcategories/ListSubCategoryController'

const router = Router();

//-- ROTAS USERS --
router.post("/users/create", new CreateUserController().handle);
router.post("/users/login", new AuthUserController().handle);
router.get("/users/me", new DetailUserController().handle);

//-- ROTAS PRODUTOS --
router.post("/products/create", new CreateProductsController().handle);
router.get("/products/list", new ListProductsControllers().handle);
router.put("/products/update", new UpdateProductsControllers().handle);
router.delete("/products/delete", new DeleteProductsControllers().handle);

//-- ROTAS CATEGORIAS --
router.post('/categories/create', new CreateCategoryController().handle);
router.get('/categories/list', new ListCategoryController().handle);

//-- ROTAS SUB-CATEGORIAS --
router.post('/subcategories/create', new CreateSubCategoryController().handle);
router.get('/subcategories/list', new ListSubCategoryController().handle);

export { router }