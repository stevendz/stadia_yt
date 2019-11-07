import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stadia/second.dart';

void main() {
  SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(MyApp());
}

class Game {
  ImageProvider img;
  String title;
  int played;
  double progress;
  Game({this.img, this.title, this.played, this.progress});
}

class Friend {
  ImageProvider img;
  String name;
  bool online;
  Friend({this.img, this.name, this.online});
}

List<Friend> friends = [
  Friend(
    img: AssetImage('assets/avatars/sansa.jpg'),
    name: 'Sansa',
    online: true,
  ),
  Friend(
    img: AssetImage('assets/avatars/arya.jpg'),
    name: 'Arya',
    online: false,
  ),
  Friend(
    img: AssetImage('assets/avatars/daenerys.jpg'),
    name: 'Daenerys',
    online: false,
  ),
  Friend(
    img: AssetImage('assets/avatars/tyrion.jpg'),
    name: 'Tyrion',
    online: false,
  ),
];

List<Game> games = [
  Game(
    img: AssetImage('assets/games/assasins.jpg'),
    title: 'Assasins Creed',
    played: 10,
    progress: 0.25,
  ),
  Game(
    img: AssetImage('assets/games/horizon2.jpg'),
    title: 'Horizon',
    played: 50,
    progress: 0.7,
  ),
  Game(
    img: AssetImage('assets/games/cod.jpg'),
    title: 'Call of Duty',
    played: 90,
    progress: 1.0,
  ),
  Game(
    img: AssetImage('assets/games/nms.jpg'),
    title: 'No Mans Sky',
    played: 3,
    progress: 0.1,
  ),
  Game(
    img: AssetImage('assets/games/apex.jpg'),
    title: 'Apex',
    played: 27,
    progress: 0.3,
  ),
  Game(
    img: AssetImage('assets/games/fortnite.jpg'),
    title: 'Fortnite',
    played: 100,
    progress: 0.9,
  ),
];

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PageViewer(),
    );
  }
}

class PageViewer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageView(
      children: <Widget>[
        StadiaHome(),
        SecondScreen(),
      ],
    );
  }
}

class StadiaHome extends StatefulWidget {
  @override
  _StadiaHomeState createState() => _StadiaHomeState();
}

class _StadiaHomeState extends State<StadiaHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topRight,
        children: <Widget>[
          Container(
            height: 225,
            child: Image.asset('assets/header_logo.png'),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _getHeader(context),
              Padding(
                padding: EdgeInsets.all(15),
                child: Text('Last played games',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
              ),
              _getLastPlayed(),
              Padding(
                padding: EdgeInsets.all(15),
                child: Text('Friends',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _getFriend(0),
                  _getFriend(1),
                  _getFriend(2),
                  _getFriend(3),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

_getFriend(int friend) {
  return Column(
    children: <Widget>[
      Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                  colors: friends[friend].online
                      ? [Color(0xffe93c2d), Color(0xffaf0f56)]
                      : [
                          Colors.grey,
                          Colors.grey,
                        ]),
            ),
          ),
          CircleAvatar(
            radius: 32,
            backgroundImage: friends[friend].img,
          )
        ],
      ),
      SizedBox(height: 5),
      Text(friends[friend].name, style: TextStyle(fontSize: 12)),
      SizedBox(height: 25),
    ],
  );
}

_getLastPlayed() {
  return Expanded(
    child: ListView.builder(
      itemCount: 4,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(6),
                width: 40,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  image: DecorationImage(image: games[index].img),
                ),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.play_arrow,
                    color: Colors.red.shade700,
                  ),
                ),
              ),
              SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      games[index].title,
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      games[index].played.toString() + ' hours played',
                      style: TextStyle(fontSize: 12),
                    )
                  ],
                ),
              ),
              _getProgressBar(100, games[index].progress)
            ],
          ),
        );
      },
    ),
  );
}

_getProgressBar(double pBwidth, double progress) {
  return Stack(
    children: <Widget>[
      Container(
        height: 8,
        width: pBwidth,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(50)),
      ),
      Container(
        height: 8,
        width: pBwidth * progress,
        decoration: BoxDecoration(
            gradient:
                LinearGradient(colors: [Color(0xffe93c2d), Color(0xffaf0f56)]),
            borderRadius: BorderRadius.circular(50)),
      )
    ],
  );
}

_getHeader(BuildContext context) {
  return Container(
    padding: EdgeInsets.fromLTRB(15, 35, 15, 15),
    width: MediaQuery.of(context).size.width,
    child: Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Icon(Icons.menu),
              Icon(Icons.search),
            ],
          ),
        ),
        SizedBox(height: 10),
        Row(
          children: <Widget>[
            Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                          colors: [Color(0xffe93c2d), Color(0xffaf0f56)])),
                ),
                CircleAvatar(
                  radius: 38,
                  backgroundImage: AssetImage('assets/avatars/jon.jpg'),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    alignment: Alignment.center,
                    width: 28,
                    height: 28,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(colors: [
                          Colors.red.shade500,
                          Colors.red.shade900,
                        ])),
                    child: Text(
                      '39',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(width: 5),
            Text(
              'Hello\nJon Snow',
              style: TextStyle(fontSize: 28),
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 20),
          padding: EdgeInsets.all(15),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade400,
                  offset: Offset(0, 3),
                  blurRadius: 3)
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'HOURS PLAYED',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 10),
              Text(
                '297 Hours',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    color: Colors.red.shade700),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
