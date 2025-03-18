import '../DTOs/auth_dto.dart';
import '../Ratel/annotations/geral_annotations.dart';
import '../Ratel/core/response.dart';
import '../Ratel/dependency_injector/injector.dart';
import '../Ratel/handler/handler.dart';
import '../services/auth_service.dart';

class AuthHandler extends RatelHandler {
  final AuthService service;

  AuthHandler() : service = Injector().get<AuthService>();

  @Post('/auth/login')
  Future<Response> login(@Body() AuthDTO credentials) async {
    return await service.login(credentials);
  }

  @Post('/auth/register')
  Future<Response> register(@Body() AuthDTO credentials) async {
    return await service.register(credentials);
  }
}
