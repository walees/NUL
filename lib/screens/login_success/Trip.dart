class Trip {
  String firstName;
  String phoneNumber;
  String address;
  String phoneNumber1;

  Trip(this.firstName, this.phoneNumber, this.address, this.phoneNumber1);

  Map<String, dynamic> toJson() => {
        'firstName': firstName,
        'phoneNumber': phoneNumber,
        'address': address,
        'phonenumber1': phoneNumber1,
      };
}
