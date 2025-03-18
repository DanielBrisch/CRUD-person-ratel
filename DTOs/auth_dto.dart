import '../Ratel/annotations/geral_annotations.dart';

@Json()
class AuthDTO {
  late int? id;

  late String? username;

  late String? password;

  late String? confirmPassword;

  late String? cep;

  AuthDTO({
    this.id,
    this.username,
    this.password,
    this.confirmPassword,
    this.cep,
  });
}
