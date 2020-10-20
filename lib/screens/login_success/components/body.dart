import 'package:flutter/material.dart';
import 'package:maryam/screens/login_success/components/login_success_form.dart';

import 'package:maryam/size_config.dart';
import 'package:maryam/screens/login_success/Trip.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final newTrip = new Trip(null, null, null, null);
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                LoginSuccessForm(
                  data: newTrip,
                ),
                SizedBox(height: getProportionateScreenHeight(30)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
