import 'package:flutter/material.dart';
import 'Screens/Main Screen/main_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MyApp',
      theme: ThemeData(
        textTheme: const TextTheme(
          bodyText2: TextStyle(fontSize: 30.0),
        ),
        appBarTheme: const AppBarTheme(
            toolbarHeight: 60.0,
            centerTitle: true,
            backgroundColor: Colors.amber,
            elevation: 5.0,
            titleTextStyle: TextStyle(
              fontSize: 25.0,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            )),
      ),
      initialRoute: MainScreen.id,
      routes: {
        MainScreen.id : (context) => const MainScreen(),
      },
    );
  }
}
