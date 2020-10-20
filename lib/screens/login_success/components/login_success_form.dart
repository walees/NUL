import 'package:flutter/material.dart';
import 'package:maryam/components/custom_surfix_icon.dart';
import 'package:maryam/components/form_error.dart';
import 'package:maryam/components/default_button.dart';
import 'package:maryam/payment/before_payment.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:maryam/screens/login_success/Trip.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
import 'package:http/http.dart' as http;

// ignore: must_be_immutable
class LoginSuccessForm extends StatefulWidget {
  final Trip data;
  LoginSuccessForm({Key key, @required this.data}) : super(key: key);

  @override
  _LoginSuccessFormState createState() => _LoginSuccessFormState();
}

class _LoginSuccessFormState extends State<LoginSuccessForm> {
  final myController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  final db = FirebaseFirestore.instance;
  final trip = new Trip(null, null, null, null);

  Future getData() async {
    var res = await http.get(
        'https://nul.digitalphoenix.com.ng/get.php?firstname=' +
            firstName +
            '&phonenumber=' +
            phoneNumber +
            '&addres=' +
            address +
            '&phonenumber1=' +
            phoneNumber1 +
            '');
    print(res.body);
  }

  @override
  void initState() {
    super.initState();
  }

  String firstName;
  String phoneNumber;
  String address;
  String phoneNumber1;

  void addError({String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildAddressFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPhoneNumber1FormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildAddress1FormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPhoneNumberFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(40)),
          DefaultButton(
            text: "Continue",
            press: () async {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                // if all are valid then go to success screen

                await db.collection("trips").add(trip.toJson());
                trip.firstName = firstName;
                trip.address = address;
                trip.phoneNumber = phoneNumber;
                trip.phoneNumber1 = phoneNumber1;
                //Navigator.pushNamed(context, BeforePayment.routeName);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BeforePayment(data: trip)),
                );
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildPhoneNumber1FormField() {
    return TextFormField(
      keyboardType: TextInputType.phone,
      onSaved: (newValue) => phoneNumber1 = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPhoneNumber1NullError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPhoneNumber1NullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Pickup Phone Number",
        hintText: "Enter pickup phone number",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Phone.svg"),
      ),
    );
  }

  TextFormField buildPhoneNumberFormField() {
    return TextFormField(
      keyboardType: TextInputType.phone,
      onSaved: (newValue) => phoneNumber = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPhoneNumberNullError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPhoneNumberNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Drop Off Phone Number",
        hintText: "Enter drop off phone number",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Phone.svg"),
      ),
    );
  }

  TextFormField buildAddress1FormField() {
    return TextFormField(
      onSaved: (newValue) => address = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kAddress1NullError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kAddress1NullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Drop Off Address",
        hintText: "Enter Drop Off Address",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon:
            CustomSurffixIcon(svgIcon: "assets/icons/Location point.svg"),
      ),
    );
  }

  TextFormField buildAddressFormField() {
    return TextFormField(
      onSaved: (newValue) => firstName = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kAddressNullError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kAddressNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Pickup Address",
        hintText: "Enter Pickup Address",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon:
            CustomSurffixIcon(svgIcon: "assets/icons/Location point.svg"),
      ),
    );
  }
}
