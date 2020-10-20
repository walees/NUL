import 'package:contactus/contactus.dart';
import 'package:flutter/material.dart';



class Contact extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        bottomNavigationBar: ContactUsBottomAppBar(
          companyName: 'Nul Synergy',
          textColor: Colors.black,
          backgroundColor: Colors.white,
          email: 'arc.normal@gmail.com',
        ),
        backgroundColor: Colors.white,
        body: ContactUs(
          cardColor: Colors.red.shade700,
          textColor: Colors.black,
          logo: AssetImage('assets/images/chat.png'),
          email: 'arc.normal@gmail.com',
          companyName: 'Nul Synergy',
          companyColor: Colors.red.shade700,
          phoneNumber: '08145152575',
          website: 'nulsynergy.com',
          tagLine: 'Delivery Mobile App -- NulXpress',
          taglineColor: Colors.black,
          twitterHandle: 'LtdNul',
          instagram: 'nul_synergy',
        ),
      ),
    );
  }
}