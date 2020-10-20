import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../components/default_button.dart';
import 'package:http/http.dart' as http;
import 'package:maryam/screens/login_success/Trip.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:maryam/screens/login_success/login_success_screen.dart';
import 'package:maryam/payment/pages/CheckoutMethodCard.dart';

// ignore: must_be_immutable
class BeforePayment extends StatelessWidget {
  final trip = new Trip(null, null, null, null);
  final Trip data;
  BeforePayment({this.data});
  String firstName;
  String phoneNumber;
  String address;
  String phoneNumber1;
  var method = 'Payment via card';
  final db = FirebaseFirestore.instance;

  static String routeName = "/before_payment";
  Future getData() async {
    var res = await http.get(
        'https://nul.digitalphoenix.com.ng/get.php?firstname=' +
            data.firstName +
            '&phonenumber=' +
            data.phoneNumber +
            '&addres=' +
            data.address +
            '&phonenumber1=' +
            data.phoneNumber1 +
            '');
    print(res.body);
  }

  Future sendData() async {
    var res = await http.get(
        'https://us-central1-maryam-6b14a.cloudfunctions.net/sendEmail?dest=walida003@gmail.com&p_add=' +
            data.address +
            '&d_add=' +
            data.phoneNumber1 +
            '&f_add=' +
            data.firstName +
            '&p1_add=' +
            data.phoneNumber +
            '');
    // http.Response response = await http.get(res);
    // var data = jsonDecode(response.body);
    print(res.body);
  }

  Future send1Data() async {
    var res = await http.get(
        'https://us-central1-maryam-6b14a.cloudfunctions.net/sendMail?dest=walida003@gmail.com&p_add=' +
            data.address +
            '&d_add=' +
            data.phoneNumber1 +
            '&f_add=' +
            data.firstName +
            '&p1_add=' +
            data.phoneNumber +
            '');
    // http.Response response = await http.get(res);
    // var data = jsonDecode(response.body);
    print(res.body);
    // ignore: unrelated_type_equality_checks
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select Preferred Payment option"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            DefaultButton(
              text: "Payment via card",
              press: () async {
                sendData();
                getData();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CheckoutMethodCard(data: trip)),
                );
              },
            ),
            SizedBox(
              height: 20,
            ),
            DefaultButton(
                text: "Payment on Delivery",
                press: () async {
                  send1Data();
                  getData();

                  AwesomeDialog(
                      context: context,
                      animType: AnimType.LEFTSLIDE,
                      headerAnimationLoop: false,
                      dialogType: DialogType.SUCCES,
                      title: 'Succes',
                      desc: 'Pickup Request made Successfully',
                      btnOkOnPress: () {
                        Navigator.pushNamed(
                            context, LoginSuccessScreen.routeName);

                        debugPrint('OnClcik');
                      },
                      btnOkIcon: Icons.check_circle,
                      onDissmissCallback: () {
                        debugPrint('Dialog Dissmiss from callback');
                      })
                    ..show();
                }),
          ],
        ),
      )),
    );
  }
}
