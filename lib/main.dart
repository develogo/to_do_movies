import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:to_do_list/app/adapters/movie.dart';
import 'package:to_do_list/app/shared/styles/texts.dart';

import 'app/app_module.dart';
import 'app/app_widget.dart';

import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: ExpandHero(),
//     );
//   }
// }

// class ExpandHero extends StatefulWidget {
//   @override
//   _ExpandHeroState createState() => _ExpandHeroState();
// }

// class _ExpandHeroState extends State<ExpandHero> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Colors.blue,
//         body: ListView.separated(
//           separatorBuilder: (context, index) => SizedBox(
//             height: 10,
//           ),
//           itemBuilder: (context, index) => GestureDetector(
//             child: Hero(
//               tag: "flipcardHero$index",
//               child: Container(
//                 color: Colors.red,
//                 height: 50,
//                 width: 150,
//               ),
//             ),
//             onTap: () {
//               Navigator.of(context).push(
//                 PageRouteBuilder(
//                   opaque: false,
//                   pageBuilder: (_, __, ___) =>
//                       ExpandHeroDetail(id: 'flipcardHero$index'),
//                 ),
//               );
//             },
//           ),
//           itemCount: 100,
//         ));
//   }
// }

// class ExpandHeroDetail extends StatefulWidget {
//   final id;
//   ExpandHeroDetail({@required this.id});

//   @override
//   _ExpandHeroDetailState createState() => _ExpandHeroDetailState();
// }

// class _ExpandHeroDetailState extends State<ExpandHeroDetail> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.transparent,
//       body: GestureDetector(
//         onTap: () {
//           Navigator.pop(context);
//         },
//         child: Container(
//           color: Colors.transparent,
//           child: BackdropFilter(
//             filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
//             child: GestureDetector(
//               child: Center(
//                 child: Hero(
//                   tag: widget.id,
//                   child: Container(
//                     color: Colors.yellow,
//                     height: MediaQuery.of(context).size.height / 2,
//                     width: MediaQuery.of(context).size.width / 2,
//                   ),
//                 ),
//               ),
//               onTap: () {
//                 Navigator.pop(context);
//               },
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var dir = await getApplicationDocumentsDirectory();
  Hive.init(dir.path);
  Hive.registerAdapter(MovieAdapter());
  await Hive.openBox<Movie>('movies');

  runApp(ModularApp(module: AppModule(), child: AppWidget()));
}
