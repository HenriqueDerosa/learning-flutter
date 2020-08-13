import 'package:flutter/material.dart';
import 'package:techs/views/counter.dart';
import 'package:techs/views/my_home_page.dart';
import 'package:techs/views/settings.dart';

class Routes {
  static const String home = '/home';
  static const String counter = '/counter';
  static const String settings = '/settings';

  static Map<String, WidgetBuilder> builder = <String, WidgetBuilder>{
    home: (BuildContext context) => MyHomePage(),
    counter: (BuildContext context) => CounterPage(),
    settings: (BuildContext context) => Settings(),
  };
}
