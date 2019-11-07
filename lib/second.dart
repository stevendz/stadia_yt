import 'package:flutter/material.dart';
import 'main.dart';

class SecondScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _getHeader(),
          Padding(
            padding: EdgeInsets.all(15),
            child: Text('Popular with Friends',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
          ),
          _getPopular(),
          Padding(
            padding: EdgeInsets.all(15),
            child: Text('Continue Playing',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
          ),
          _getContinuePlaying(),
        ],
      ),
    );
  }
}

_getContinuePlaying() {
  return Stack(
    alignment: Alignment.bottomRight,
    children: <Widget>[
      Container(
        margin: EdgeInsets.fromLTRB(15, 0, 15, 25),
        height: 135,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            colors: [
              Color(0xffe93c2d),
              Color(0xffaf0f56),
            ],
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(25),
              margin: EdgeInsets.all(15),
              width: 80,
              height: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(image: games[0].img)),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.play_arrow, color: Colors.red.shade700),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    games[0].title,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(height: 5),
                  Text(
                    games[0].played.toString() + ' hours played',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      Positioned(
        bottom: 10,
        right: 10,
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.white,
          child: Icon(Icons.search, size: 30, color: Colors.red.shade700),
        ),
      )
    ],
  );
}

_getPopular() {
  return Container(
    height: 200,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: games.length,
      itemBuilder: (context, index) {
        return Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 8, bottom: 20),
              width: 140,
              height: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: games[games.length - index - 1].img),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(bottom: 7),
              width: 70,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey, offset: Offset(0, 2), blurRadius: 4)
                ],
              ),
              child: Text('Play',
                  style: TextStyle(
                      color: Colors.red.shade700, fontWeight: FontWeight.w700)),
            ),
          ],
        );
      },
    ),
  );
}

_getHeader() {
  return Expanded(
    child: Container(
      padding: EdgeInsets.fromLTRB(15, 35, 15, 25),
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover, image: AssetImage('assets/new_header.jpg'))),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Colors.white)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Icon(Icons.menu, color: Colors.white),
                Icon(Icons.search, color: Colors.white),
              ],
            ),
          ),
          Expanded(
            child: Container(),
          ),
          Text(
            'NEW GAME',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12),
          ),
          Text(
            'Sekiro: Shadows Die Twice',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w500, fontSize: 20),
          ),
          SizedBox(height: 25),
          Container(
            alignment: Alignment.center,
            height: 30,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              gradient: LinearGradient(
                  colors: [Color(0xffe93c2d), Color(0xffaf0f56)]),
            ),
            child: Text('Play', style: TextStyle(color: Colors.white)),
          )
        ],
      ),
    ),
  );
}
