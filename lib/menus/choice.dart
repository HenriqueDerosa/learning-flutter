import 'package:flutter/material.dart';

class Choice {
  const Choice({this.title, this.icon, this.routeName});

  final String title;
  final IconData icon;
  final String routeName;
}

class ChoiceCard extends StatelessWidget {
  const ChoiceCard({Key key, this.choice}) : super(key: key);

  final Choice choice;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.bodyText1;
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(choice.icon, size: 18.0, color: textStyle.color),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Text(choice.title, style: textStyle),
          ),
        ],
      ),
    );
  }
}
