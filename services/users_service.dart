import '../Ratel/annotations/geral_annotations.dart';
import '../entities/user.dart';
import '../repository/user_repository/iusers_repository.dart';

class UsersService {
  final IUsersRepository repository;

  UsersService({required this.repository});

  Future<List<User>> listUsers() async {
    return await repository.getAll();
  }

  Future<User> getUserById(@Param() int id) async {
    return await repository.getUserById(id);
  }

  Future<void> deleteUserById(@Param() int id) async {
    await repository.deleteUserById(id);
  }
}
