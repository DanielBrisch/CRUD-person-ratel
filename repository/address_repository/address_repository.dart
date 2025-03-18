import '../../Ratel/database/repository.dart';
import '../../entities/adress.dart';
import 'iaddress_repository.dart';

class AddressRepository extends RatelRepository<Address>
    implements IAddressRepository {
  @override
  Future<int> insertAddress(Address address) async {
    final sql = """
    INSERT INTO address 
      (cep, street, complement, unit, neighborhood, locality, uf, estado, region, ibge_code, gia_code, ddd, siafi_code)
    VALUES 
      (@cep, @street, @complement, @unit, @neighborhood, @locality, @uf, @estado, @region, @ibge_code, @gia_code, @ddd, @siafi_code)
    RETURNING id;
  """;

    final newAddress = await execute(sql, substitutionValues: {
      'cep': address.cep,
      'street': address.street,
      'complement': address.complement,
      'unit': address.unit,
      'neighborhood': address.neighborhood,
      'locality': address.locality,
      'uf': address.uf,
      'estado': address.estado,
      'region': address.region,
      'ibge_code': address.ibgeCode,
      'gia_code': address.giaCode,
      'ddd': address.ddd,
      'siafi_code': address.siafiCode,
    });

    return newAddress[0];
  }
}
