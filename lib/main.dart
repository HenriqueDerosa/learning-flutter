import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:techs/core/navigation_bloc.dart';
import 'package:techs/core/routes.dart';

import 'package:techs/views/my_home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yow',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        accentColor: Colors.deepOrange,
      ),
      home: Center(
        child: BlocProvider(
          blocs: [Bloc((i) => NavigationBloc())],
          child: MyHomePage(title: 'First App'),
        ),
      ),
      routes: Routes.builder,
    );
  }
}
