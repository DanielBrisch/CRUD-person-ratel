import '../../Ratel/database/repository.dart';
import '../../entities/adress.dart';
import '../../entities/user.dart';
import '../address_repository/address_repository.dart';
import 'iusers_repository.dart';

class UsersRepository extends RatelRepository<User>
    implements IUsersRepository {
  final AddressRepository addressRepository;

  UsersRepository({required this.addressRepository});

  @override
  Future<User?> getUserByUsername(String username) async {
    final sql =
        'SELECT id, username, password FROM users WHERE username = @username';

    final result = await query(sql, substitutionValues: {'username': username});

    if (result.isEmpty) return null;

    return result.first;
  }

  @override
  Future<List<User>> getAll() async {
    final sql = 'SELECT id, username, address_id FROM users';
    final result = await query(sql);
    return result;
  }

  @override
  Future<User> getUserById(int id) async {
    final sql = 'SELECT id, username, address_id FROM users WHERE id=@id;';
    final result = await query(sql, substitutionValues: {'id': id});
    return result.first;
  }

  @override
  Future<void> createUser(
      String username, String password, Address adress) async {
    final sql =
        'INSERT INTO users (username, password, address_id) VALUES (@username, @password, @address_id);';

    final idNewAddress = await addressRepository.insertAddress(adress);

    await execute(sql, substitutionValues: {
      'username': username,
      'password': password,
      'address_id': idNewAddress
    });
  }

  @override
  Future<void> deleteUserById(int id) async {
    final sql = 'DELETE FROM person WHERE id=@id;';

    await execute(sql, substitutionValues: {'id': id});
  }
}
