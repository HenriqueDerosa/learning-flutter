import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:techs/core/navigation_bloc.dart';

class TabOptions extends StatefulWidget {
  TabOptions({Key key, this.tab}) : super(key: key);

  final int tab;
  @override
  _TabOptionsState createState() => _TabOptionsState();
}

class _TabOptionsState extends State<TabOptions> {
  NavigationBloc _bloc = BlocProvider.getBloc<NavigationBloc>();
  String dropdownValue = 'Settings';

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        buildSearchButton(_bloc),
      ],
    );
  }

  Widget buildSearchButton(NavigationBloc _bloc) {
    if (widget.tab == 1) {
      return Container();
    }
    if (_bloc.state.search) {
      return IconButton(
        onPressed: () {
          _bloc.enableSearch(true);
        },
        icon: Icon(Icons.close, color: Colors.white),
      );
    }
    return IconButton(
      onPressed: () {
        _bloc.enableSearch(false);
      },
      icon: Icon(Icons.search, color: Colors.white),
    );
  }
}
