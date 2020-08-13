import 'package:flutter/material.dart';

class Feed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          child: Column(
            children: [
              FeedCard(title: 'Flying with your skate'),
              FeedCard(title: 'Dr and the Time Machine'),
              FeedCard(title: 'Car moved by garbage'),
              FeedCard(title: 'How to make your own Time Machine'),
            ],
          ),
        ),
      ),
    );
  }
}

class FeedCard extends StatelessWidget {
  const FeedCard({
    Key key,
    @required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: FlatButton(
        onPressed: () {},
        color: Theme.of(context).cardColor,
        padding: EdgeInsets.only(left: 16.0, right: 0),
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
          side: BorderSide(color: Theme.of(context).backgroundColor),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width / 2),
              child: Text(
                title,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Image(
              height: 180,
              image: NetworkImage(
                'https://source.unsplash.com/random',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
