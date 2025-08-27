import 'package:flutter/material.dart';
import '../screens/saved_locations_screen.dart';

void startAddressFlow(BuildContext context, List<String> savedAddresses) {
  if (savedAddresses.isEmpty) {
    Navigator.pushNamed(context, '/empty');
  } else if (savedAddresses.length == 1) {
    Navigator.pushNamed(context, '/delivery');
  } else {
    Navigator.pushNamed(context, '/saved');
  }
}
