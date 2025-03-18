import '../Ratel/annotations/geral_annotations.dart';

@Json()
class User {
  @Column(name: 'id')
  late int? id;

  @Column(name: 'username')
  late String? userName;

  @Column(name: 'password')
  late String? password;

  @Column(name: 'address_id')
  late int? address_id;

  User({
    this.id,
    this.userName,
    this.password,
    this.address_id,
  });
}
