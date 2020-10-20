import 'package:flutter/material.dart';
import 'package:maryam/size_config.dart';
import 'contact.dart';


class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                
                Contact(),
                SizedBox(height: getProportionateScreenHeight(30)),
        
              ],
            ),
          ),
        ),
      ),
      
    );
    
  }
}