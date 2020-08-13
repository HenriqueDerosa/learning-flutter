import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2000),
        lastDate: DateTime(2999));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Settings', style: Theme.of(context).textTheme.headline4),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Font size',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Slider(
                    value: 3,
                    max: 10,
                    min: 0,
                    onChanged: (value) {
                      print('value is $value');
                    },
                  ),
                ],
              ),
              FlatButton(
                child: Row(
                  children: [
                    Icon(Icons.calendar_today),
                    Text('Schedule something'),
                  ],
                ),
                onPressed: () => _selectDate(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
