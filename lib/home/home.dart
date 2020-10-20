import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:maryam/screens/login_success/login_success_screen.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import '../size_config.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {
  final RoundedLoadingButtonController _btnController =
      new RoundedLoadingButtonController();

  void _doSomething() async {
    Timer(Duration(seconds: 10), () {
      _btnController.success();
    });
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginSuccessScreen()),
    );
  }

  String email = "";
  Future getEmail() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      email = preferences.getString('email');
    });
  }

  @override
  void initState() {
    super.initState();
    getEmail();
  }

  int photoIndex = 0;

  List<String> photos = [
    'assets/images/burger1.jpg',
    'assets/images/burger2.jpg',
    'assets/images/burger3.jpg',
    'assets/images/burger4.jpg'
  ];
  void _nextImage() {
    setState(() {
      photoIndex = photoIndex < photos.length - 1 ? photoIndex + 1 : photoIndex;
    });
  }

  void _previousImage() {
    setState(() {
      photoIndex = photoIndex > 0 ? photoIndex - 1 : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Center(
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.0),
                    image: DecorationImage(
                        image: AssetImage(photos[photoIndex]),
                        fit: BoxFit.cover)),
                height: 250.0,
                width: 400.0,
              ),
              Positioned(
                top: 240.0,
                left: 25.0,
                right: 25.0,
                child: SelectedPhoto(
                    numberOfDots: photos.length, photoIndex: photoIndex),
              )
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text('Prev'),
              onPressed: _previousImage,
              elevation: 5.0,
              color: Colors.green,
            ),
            SizedBox(width: 10.0),
            RaisedButton(
              child: Text('Next'),
              onPressed: _nextImage,
              elevation: 5.0,
              color: Colors.blue,
            )
          ],
        ),
        SizedBox(height: 35.0),
        Container(
          alignment: Alignment.center,
          child: Image.asset(
            "assets/images/burger4.png",
            width: 400.0,
          ),
        ),
        SizedBox(height: 35.0),
        RoundedLoadingButton(
          child: Text('Click Here To Request',
              style: TextStyle(
                color: Colors.white,
                fontSize: getProportionateScreenWidth(18),
              )),
          controller: _btnController,
          onPressed: _doSomething,
          color: Colors.red[700],
        ),
      ],
    ));
  }
}

class SelectedPhoto extends StatelessWidget {
  final int numberOfDots;
  final int photoIndex;

  SelectedPhoto({this.numberOfDots, this.photoIndex});

  Widget _inactivePhoto() {
    return new Container(
        child: new Padding(
      padding: const EdgeInsets.only(left: 3.0, right: 3.0),
      child: Container(
        height: 8.0,
        width: 8.0,
        decoration: BoxDecoration(
            color: Colors.grey, borderRadius: BorderRadius.circular(4.0)),
      ),
    ));
  }

  Widget _activePhoto() {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(left: 3.0, right: 3.0),
        child: Container(
          height: 10.0,
          width: 10.0,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.0),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey, spreadRadius: 0.0, blurRadius: 2.0)
              ]),
        ),
      ),
    );
  }

  List<Widget> _buildDots() {
    List<Widget> dots = [];

    for (int i = 0; i < numberOfDots; ++i) {
      dots.add(i == photoIndex ? _activePhoto() : _inactivePhoto());
    }

    return dots;
  }

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: _buildDots(),
      ),
    );
  }
}
