import 'package:flutter/material.dart';

class Thanks extends StatelessWidget {
  static String routeName = "/thanks";
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Text Over Image Image Example'),
      ),
      body: Center(
        child: Container(
          height: 250,
          width: 170,
          child: Stack(
            children: <Widget>[
              Center(
                child: new Image.asset(
                  'assets/images/success.png',
                  width: size.width,
                  height: size.height,
                  fit: BoxFit.fill,
                ),
              ),
              Center(
                child: Text("This is a Text",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 28.0,
                        color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
