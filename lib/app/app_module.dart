import 'package:flutter_modular/flutter_modular.dart';
import 'package:to_do_list/app/modules/splash/splash_module.dart';

import 'modules/home/home_module.dart';
import 'services/local_storage_service.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => LocalStorageService()),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/', module: SplashModule()),
    ModuleRoute('/home', module: HomeModule()),
  ];
}
