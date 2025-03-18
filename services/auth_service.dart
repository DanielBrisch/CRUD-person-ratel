import 'dart:io' as http;

import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';

import '../DTOs/auth_dto.dart';
import '../Ratel/annotations/geral_annotations.dart';
import '../Ratel/client.dart';
import '../Ratel/core/response.dart';
import '../entities/adress.dart';
import '../repository/user_repository/iusers_repository.dart';

class AuthService {
  final IUsersRepository repository;
  AuthService({required this.repository});

  Future<Response> login(AuthDTO credentials) async {
    final user = await repository.getUserByUsername(credentials.username!);
    if (user == null) {
      return Response(
          statusCode: http.HttpStatus.notFound, data: 'User not registered');
    }
    if (user.password != credentials.password) {
      return Response(
          statusCode: http.HttpStatus.unauthorized,
          data: 'Invalid credentials');
    }
    final payload = {
      'username': credentials.username,
      'password': credentials.password,
    };
    final jwt = JWT(payload);
    final token = jwt.sign(SecretKey(Auth.jwtKey!));
    return Response(statusCode: http.HttpStatus.ok, data: {'token': token});
  }

  Future<Response> register(AuthDTO credentials) async {
    if (credentials.username == null ||
        credentials.password == null ||
        credentials.confirmPassword == null ||
        credentials.cep == null) {
      return Response(
          statusCode: http.HttpStatus.badRequest,
          data: 'Missing required fields');
    }
    if (credentials.username!.isEmpty ||
        credentials.password!.isEmpty ||
        credentials.cep!.isEmpty) {
      return Response(
          statusCode: http.HttpStatus.badRequest,
          data: 'Some data has be empty');
    }
    final user = await repository.getUserByUsername(credentials.username!);
    if (user != null && user.userName!.isNotEmpty) {
      return Response(
          statusCode: http.HttpStatus.conflict,
          data: 'A user with this username already exists');
    }
    if (credentials.password! != credentials.confirmPassword!) {
      return Response(
          statusCode: http.HttpStatus.badRequest,
          data: 'Passwords do not match');
    }

    Map<String, dynamic> response = await getCep(credentials.cep!);
    Address address = Address.fromJson(response);

    await repository.createUser(
      credentials.username!,
      credentials.password!,
      address,
    );

    return Response(
        statusCode: http.HttpStatus.created,
        data: 'User registered successfully');
  }

  Future<Map<String, dynamic>> getCep(String cep) async {
    var client = Request('https://viacep.com.br');
    final response = await client.get('/ws/$cep/json/');

    if (response.statusCode != 200) {
      throw Exception(
          'erro ao pegar dados por cep, Código de status: ${response.statusCode}');
    }

    return response.data;
  }
}
