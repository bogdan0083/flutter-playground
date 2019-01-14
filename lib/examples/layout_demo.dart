import 'package:flutter/material.dart';

class LayoutDemo extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Layout Demo'),
      ),
      body: Builder(
        builder: (BuildContext ctx) {
          return ListView(
            children: <Widget>[
              Image.network(
                'https://raw.githubusercontent.com/flutter/website/master/examples/layout/lakes/step5/images/lake.jpg',
                width: 600.0,
                height: 240.0,
                fit: BoxFit.cover,
              ),
              _renderTitleSection(),
              _renderButtonSection(ctx),
              _renderTextSection(),
            ],
          );
        },
      ),
    );
  }

  Widget _renderTitleSection() {
    return Container(
      padding: const EdgeInsets.all(32.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    'Oeschinen Lake Campground',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  'Kandersteg, Switzerland',
                  style: TextStyle(color: Colors.black54),
                ),
              ],
            ),
          ),
          Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          Container(
            child: Text('41'),
            margin: EdgeInsets.only(left: 4.0),
          )
        ],
      ),
    );
  }

  Widget _renderButtonSection(BuildContext context) {
    Color color = Theme.of(context).primaryColor;
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _renderButton(
            color: color,
            icon: Icons.call,
            text: 'CALL',
            context: context,
          ),
          _renderButton(
            color: color,
            icon: Icons.near_me,
            text: 'ROUTE',
            context: context,
          ),
          _renderButton(
            color: color,
            icon: Icons.share,
            text: 'SHARE',
            context: context,
          ),
        ],
      ),
    );
  }

  Column _renderButton({
    Color color,
    IconData icon,
    String text,
    BuildContext context,
  }) {
    return Column(
      children: <Widget>[
        InkWell(
          onTap: () {
            _onButtonTap(text, context);
          },
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                Icon(
                  icon,
                  color: color,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    text,
                    style: TextStyle(color: color),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _renderTextSection() {
    return Container(
      padding: const EdgeInsets.all(32.0),
      child: Text(
        'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
            'Alps. Situated 1,578 meters above sea level, it is one of the '
            'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
            'half-hour walk through pastures and pine forest, leads you to the '
            'lake, which warms to 20 degrees Celsius in the summer. Activities '
            'enjoyed here include rowing, and riding the summer toboggan run.',
        softWrap: true,
      ),
    );
  }

  GestureTapCallback _onButtonTap(String snackText, BuildContext context) {
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text('$snackText is clicked!'),
      ),
    );
  }
}
