import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Layout Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flutter Layout Demo'),
    );
  }
}

class FavoriteWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FavoriteWidgetState();
}

class FavoriteWidgetState extends State<FavoriteWidget> {
  bool isFavorited = true;
  int favoriteCount = 41;

  void _toggleFavorite() {
    setState(() {
      if (isFavorited) {
        isFavorited = false;
        favoriteCount--;
      } else {
        isFavorited = true;
        favoriteCount++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(0.0),
          child: IconButton(
              icon: Icon(
                isFavorited ? Icons.star : Icons.star_border,
                color: Colors.red,
              ),
              onPressed: _toggleFavorite),
        ),
        SizedBox(
          width: 18.0,
          child: Container(child: Text("$favoriteCount")),
        )
      ],
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    Column buildColumn(IconData icon, String label) {
      Color color = Theme.of(context).primaryColor;

      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color),
          Container(
            margin: EdgeInsets.all(8.0),
            child: Text(
              label,
              style: TextStyle(
                  color: color, fontSize: 12.0, fontWeight: FontWeight.w400),
            ),
          )
        ],
      );
    }

    Widget titleSection = Container(
        padding: EdgeInsets.all(32.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      "Oeschinen Lake Campground",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    "Kandersteg, Switzerland",
                    style: TextStyle(color: Colors.grey[500]),
                  )
                ],
              ),
            ),
            FavoriteWidget(),
          ],
        ));

    Widget buttonSection = Container(
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        buildColumn(Icons.call, "CALL"),
        buildColumn(Icons.near_me, "ROUTE"),
        buildColumn(Icons.share, "SHARE"),
      ]),
    );

    Widget textSection = Container(
      padding: EdgeInsets.all(32.0),
      child: Text(
        '''
Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.
        ''',
        softWrap: true,
      ),
    );

    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new ListView(
        children: <Widget>[
          Image.asset(
            "images/lake.jpg",
            fit: BoxFit.cover,
            height: 240.0,
          ),
          titleSection,
          buttonSection,
          textSection
        ],
      ),
    );
  }
}
