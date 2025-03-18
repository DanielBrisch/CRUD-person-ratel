import '../../entities/adress.dart';
import '../../entities/user.dart';

abstract class IUsersRepository {
  Future<User?> getUserByUsername(String username);

  Future<List<User>> getAll();

  Future<User> getUserById(int id);

  Future<void> createUser(String username, String password, Address adress);

  Future<void> deleteUserById(int id);
}
