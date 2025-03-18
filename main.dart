import 'package:dotenv/dotenv.dart';

import 'Ratel/annotations/geral_annotations.dart';
import 'Ratel/core/server.dart';
import 'Ratel/database/database.dart';
import 'global_bindings.dart';
import 'handlers/auth_handler.dart';
import 'handlers/users_handler.dart';

void main() async {
  var env = DotEnv()..load();

  Auth.jwtKey = env['JWT_KEY'];

  final server = RatelServer(
    port: int.tryParse(env['PORT_SERVER']!)!,
    handlers: [
      UsersHandler,
      AuthHandler,
    ],
    database: RatelDatabase(
      host: env['DB_HOST'].toString(),
      databaseName: env['DB_NAME'].toString(),
      username: env['DB_USER'].toString(),
      password: env['DB_PASSWORD'].toString(),
      port: env['DB_PORT'].toString(),
    ),
    jwtKey: env['JWT_KEY'],
    bindings: GlobalBindings(),
  );

  server.startServer();
}
