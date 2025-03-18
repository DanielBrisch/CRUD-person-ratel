import '../../entities/adress.dart';

abstract class IAddressRepository {
  Future<int> insertAddress(Address address);
}
