import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:techs/core/navigation_bloc.dart';
import 'package:techs/core/routes.dart';
import 'package:techs/core/tab_options.dart';
import 'package:techs/menus/choice.dart';
import 'package:techs/views/first_screen.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  List<Choice> choices = <Choice>[
    new Choice(
      title: 'Notes',
      icon: Icons.insert_drive_file,
      routeName: Routes.home,
    ),
    new Choice(
      title: 'Settings',
      icon: Icons.settings,
      routeName: Routes.settings,
    ),
    new Choice(
      title: 'About',
      icon: Icons.info,
      routeName: Routes.counter,
    ),
  ];

  final List<Tab> myTabs = <Tab>[
    new Tab(text: 'FEED'),
    new Tab(text: 'RECIPES'),
  ];

  final List<Widget> _pageOptions = [
    Text('yep'),
    FirstScreen(),
  ];

  TabController _tabController;
  Choice _selectedChoice;

  NavigationBloc _bloc = BlocProvider.getBloc<NavigationBloc>();

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: myTabs.length);
    _selectedChoice = choices[0];
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _select(Choice choice) {
    print(choice.title);
    // Causes the app to rebuild with the new _selectedChoice.
    setState(() {
      _selectedChoice = choice;
    });

    if (choice != null) {
      Navigator.of(context).pushNamed(choice.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          PopupMenuButton<Choice>(
            onSelected: _select,
            itemBuilder: (BuildContext context) {
              return choices.map((Choice choice) {
                return PopupMenuItem<Choice>(
                  value: choice,
                  child: ChoiceCard(
                    choice: choice,
                  ),
                );
              }).toList();
            },
          ),
        ],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            StreamBuilder<NavigationState>(
                stream: _bloc.stream,
                builder: (context, snapshot) {
                  if (!snapshot.hasData || snapshot.hasError) {
                    return Text('Error');
                  }
                  if (snapshot.data.search) {
                    return Expanded(
                      child: TextFormField(
                        autofocus: true,
                        keyboardType: TextInputType.text,
                        cursorColor: Colors.amber,
                        cursorWidth: 4,
                        cursorRadius: Radius.circular(8),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                        decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          labelText: "Search here",
                          labelStyle: TextStyle(
                            color: Colors.white38,
                          ),
                        ),
                      ),
                    );
                  }
                  return Text('First App');
                }),
            StreamBuilder<NavigationState>(
                stream: _bloc.stream,
                builder: (context, snapshot) {
                  return TabOptions(tab: snapshot.data.tab);
                })
          ],
        ),
        bottom: TabBar(
          onTap: (value) {
            print('clicked on tab for $value');
            _bloc.switchTab(value);
          },
          controller: _tabController,
          indicatorColor: Theme.of(context).accentColor,
          indicatorWeight: 4,
          tabs: myTabs,
        ),
      ),
      body: Center(
        child: TabBarView(
          controller: _tabController,
          children: _pageOptions,
        ),
      ),
    );
  }
}
