import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:techs/core/navigation_bloc.dart';
import 'package:techs/views/counter.dart';

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  NavigationBloc _bloc = BlocProvider.getBloc<NavigationBloc>();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        FlatButton(
          child: Text('Go to other screen'),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => CounterPage()));
          },
        ),
        Text(
          'Yay, Hello!',
        ),
      ],
    );
  }
}
