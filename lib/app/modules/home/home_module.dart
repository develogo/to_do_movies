import 'package:to_do_list/app/modules/home/pages/add_movie/add_movie_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:to_do_list/app/modules/home/home_controller.dart';
import 'package:to_do_list/app/modules/home/pages/add_movie/add_movie_page.dart';
import '../home/home_controller.dart';

import 'home_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => AddMovieController(i.get())),
    Bind.lazySingleton((i) => HomeController(i.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => HomePage()),
    ChildRoute('/add-movie', child: (_, args) => AddMoviePage())
  ];
}
