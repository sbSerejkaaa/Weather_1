import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            title: Text(
              'Weather',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            centerTitle: true,
            leading: IconButton(icon: Icon(Icons.menu), onPressed: () {}),
            iconTheme: IconThemeData(color: Colors.black),
            brightness: Brightness.light,
            actions: <Widget>[
              IconButton(icon: Icon(Icons.settings), onPressed: () {}),
            ]),
        body: HomePage(),
      ),
      routes: {
        '/page2': (context) => Page2(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        onPressed: () {
          Navigator.pushNamed(context, '/page2');
        },
        child: Text(
          'Weather Moscow',
          style: TextStyle(
            color: Colors.indigo,
          ),
        ),
      ),
    );
    ;
  }
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Moscow'),
      ),
      body: _buildBody(),
    );
  }
}

Widget _buildBody() {
  return SingleChildScrollView(
      child: Column(
    children: <Widget>[
      _headerImage(),
      _weatherDescription(),
      _temperature(),
      Divider(),
      _tremperatureIcon(),
      Divider(),
      _stark(),
      _textDisrip(),
    ],
  ));
}

Row _temperature() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Column(
        children: <Widget>[
          Icon(
            Icons.wb_sunny,
            color: Colors.orange,
            size: 50,
          ),
          SizedBox(width: 16.0),
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    '15* Clear',
                    style: TextStyle(color: Colors.deepPurple),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Text(
                    'Day',
                    style: TextStyle(color: Colors.orange),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    ],
  );
}

Padding _weatherDescription() {
  return Padding(
    padding: EdgeInsets.all(10),
    child: Text(
      'Thuesday - June 21',
      style: TextStyle(
        fontSize: 23.0,
        color: Colors.black,
      ),
    ),
  );
}

Padding _textDisrip() {
  return Padding(
    padding: EdgeInsets.only(left: 29, top: 37),
    child: Text(
      'Данная страница показывает погоду по городу Москва на ближайшие 9 дней, мы очень рады, что вы пользуйтесь нашим приложение. Спасибо.',
      style: TextStyle(
        fontSize: 15.5,
        color: Colors.black,
      ),
    ),
  );
}

Wrap _tremperatureIcon() {
  return Wrap(
      spacing: 10.0,
      children: List.generate(9, (int index) {
        return Chip(
          label: Text(
            '${index + 20}*C',
            style: TextStyle(fontSize: 15.0),
          ),
          avatar: Icon(
            Icons.wb_cloudy,
            color: Colors.blue.shade300,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0),
            side: BorderSide(color: Colors.grey),
          ),
          backgroundColor: Colors.grey.shade100,
        );
      }));
}

Row _stark() {
  var stars = Row(children: <Widget>[
    Icon(
      Icons.star,
      size: 15.0,
      color: Colors.yellow[600],
    ),
    Icon(
      Icons.star,
      size: 15.0,
      color: Colors.yellow[600],
    ),
    Icon(
      Icons.star,
      size: 15.0,
      color: Colors.yellow[600],
    ),
    Icon(
      Icons.star,
      size: 15.0,
      color: Colors.black,
    ),
    Icon(
      Icons.star,
      size: 15.0,
      color: Colors.black,
    ),
  ]);
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      Text(
        'Оцените информацию о погоде',
        style: TextStyle(fontSize: 15.0),
      ),
      stars,
    ],
  );
}

Image _headerImage() {
  return Image(
    image: NetworkImage(
        'https://imgfon.ru/Img/Crop/2560x1440/City/arhitektura-reka-moskva-kreml-gorod.jpg?img.1'),
    fit: BoxFit.cover,
  );
}

Image _topimage() {
  return Image(
      image: NetworkImage(
          'https://proprikol.ru/wp-content/uploads/2020/04/kartinki-vselennoj-3.jpg'));
}
