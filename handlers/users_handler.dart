import '../Ratel/annotations/geral_annotations.dart';
import '../Ratel/dependency_injector/injector.dart';
import '../Ratel/handler/handler.dart';
import '../entities/user.dart';
import '../services/users_service.dart';

@Protected()
class UsersHandler extends RatelHandler {
  final UsersService service;

  UsersHandler() : service = Injector().get<UsersService>();

  @Get('/list')
  Future<List<User>> list() async {
    return await service.listUsers();
  }

  @Get('/get-by-id')
  Future<User> getUserById(@Param() int id) async {
    return await service.getUserById(id);
  }

  @Delete('/delete')
  Future<void> delete(@Param() int id) async {
    await service.deleteUserById(id);
  }
}
