import 'Ratel/annotations/geral_annotations.dart';
import 'Ratel/dependency_injector/binding.dart';
import 'Ratel/dependency_injector/injector.dart';
import 'repository/address_repository/address_repository.dart';
import 'repository/user_repository/users_repository.dart';
import 'services/auth_service.dart';
import 'services/users_service.dart';

class GlobalBindings extends Bindings {
  @override
  void dependencies() {
    Injector().Put<UsersRepository>(
      () => UsersRepository(
        addressRepository: Injector().get<AddressRepository>(),
      ),
    );
    Injector().Put<Auth>(
      () => Auth(),
    );
    Injector().Put<UsersService>(
      () => UsersService(
        repository: Injector().get<UsersRepository>(),
      ),
    );
    Injector().Put<AuthService>(
      () => AuthService(
        repository: Injector().get<UsersRepository>(),
      ),
    );
    Injector().Put<AddressRepository>(
      () => AddressRepository(),
    );
  }
}
