import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:to_do_list/app/modules/splash/splash_controller.dart';
import 'package:to_do_list/app/shared/styles/colors.dart';

class SplashPage extends StatefulWidget {
  final String title;
  const SplashPage({Key? key, this.title = "SplashPage"}) : super(key: key);
  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends ModularState<SplashPage, SplashController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Image.asset(
              'assets/images/splash_logo.jpg',
              height: 500,
              fit: BoxFit.fitHeight,
            ),
            Text(
              'Grave seus filmes',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Grave seus filmes',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 50),
            const Spacer(),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width * .8,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: kMainColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        5,
                      ),
                    ),
                  ),
                ),
                onPressed: () => Modular.to.navigate('/home/'),
                child: Text(
                  "LET'S BORA",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
