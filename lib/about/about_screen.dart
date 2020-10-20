import 'package:flutter/material.dart';
import 'package:maryam/constants.dart';
import 'package:fancy_drawer/fancy_drawer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:maryam/screens/splash/splash_screen.dart';
import 'package:maryam/contact/contact_screen.dart';
import 'package:maryam/about/about.dart';
import 'package:maryam/screens/login_success/login_success_screen.dart';
import 'package:maryam/home/home_screen.dart';

class AboutScreen extends StatefulWidget {
  AboutScreen({Key key}) : super(key: key);
  static String routeName = "/about_screen";



  @override
  _AboutScreenState createState() => _AboutScreenState();
  Widget build(BuildContext context) {
    return MaterialApp(
     
      home: AboutScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}


class _AboutScreenState extends State<AboutScreen>
    with SingleTickerProviderStateMixin {
 
  FancyDrawerController _controller;
     

  @override
  void initState() {
    super.initState();
    _controller = FancyDrawerController(
        vsync: this, duration: Duration(milliseconds: 250))
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: FancyDrawerWrapper(
        backgroundColor: Colors.white,
        controller: _controller,
        drawerItems: <Widget>[
  FlatButton(
          textColor: Colors.red.shade700,
          
          child:  Text( "Go to home",style: TextStyle(fontSize: 20.0),),
           
            onPressed: () {
             
                Navigator.pushNamed(context, HomeScreen.routeName);
       
            },
          ),
          FlatButton(
          textColor: Colors.red.shade700,
          
          child:  Text( "Request",style: TextStyle(fontSize: 20.0),),
           
            onPressed: () {
             
                Navigator.pushNamed(context, LoginSuccessScreen.routeName);
       
            },
          ),
         
          FlatButton(
          textColor: Colors.red.shade700,
          
          child:  Text( "About",style: TextStyle(fontSize: 20.0),),
           
            onPressed: () {
             
                Navigator.pushNamed(context, AboutScreen.routeName);
       
            },
          ),
         FlatButton(
          textColor: Colors.red.shade700,
          
          child:  Text( "Contact",style: TextStyle(fontSize: 20.0),),
           
            onPressed: () {
             
                Navigator.pushNamed(context, ContactScreen.routeName);
       
            },
          ),
        FlatButton(
          textColor: Colors.red.shade700,
          
          child:  Text( "Logout",style: TextStyle(fontSize: 20.0),),
           
            onPressed: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              await prefs.remove('userPreference');
              await Future.delayed(Duration(seconds: 2));

                //Navigator.pushNamed(context, LoginSuccessScreen.routeName);
       Navigator.of(context).pushAndRemoveUntil(
  // the new route
  MaterialPageRoute(
    builder: (BuildContext context) => SplashScreen(),
  ),

  // this function should return true when we're done removing routes
  // but because we want to remove all other screens, we make it
  // always return false
  (Route route) => false,
);
            },
          ),
        ],
        child: Scaffold(
          appBar: AppBar(
            elevation: 4.0,
            title: Text(
              "About NulXpress",
                style: headingStyle
            ),
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.black,
              ),
              onPressed: () {
                _controller.toggle();
              },
            ),
          ),
          body: About(),
        ),
      ),
    );
  }
}