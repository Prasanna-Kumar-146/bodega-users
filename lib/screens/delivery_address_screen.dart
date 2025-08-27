import 'package:flutter/material.dart';
import '../utils/font_styles.dart';

class DeliveryAddressScreen extends StatefulWidget {
  const DeliveryAddressScreen({Key? key}) : super(key: key);

  @override
  State<DeliveryAddressScreen> createState() => _DeliveryAddressScreenState();
}

class _DeliveryAddressScreenState extends State<DeliveryAddressScreen> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, String> addressData = {};

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isWide = screenWidth > 600;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0), // ✅ Updated padding
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: isWide ? 500 : double.infinity),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Delivery Address',
                      style: PlusJakartaSansStyle.getStyle(
                        weight: 700,
                        fontSize: 18.0,
                        color: Colors.black,
                        uniquifier: 'header',
                      ),
                    ),
                    const SizedBox(height: 16.0),

                    // Address Fields
                    ..._buildTextFields(),

                    const SizedBox(height: 24.0),

                    // Buttons
                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFDFE0E2),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(9.62),
                            ),
                          ),
                          child: Text(
                            'Back',
                            style: PlusJakartaSansStyle.getStyle(
                              weight: 700,
                              fontSize: 16.0,
                              color: Colors.black,
                              uniquifier: 'button',
                            ),
                          ),
                        ),
                        const SizedBox(width: 16.0),
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              Navigator.pop(context, {
                                'address':
                                '${addressData['house']}, ${addressData['street']}, ${addressData['area']}',
                                'details':
                                '${addressData['landmark']}, ${addressData['city']}, ${addressData['district']}, ${addressData['state']} - ${addressData['pincode']}',
                              });
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF221662),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(9.62),
                            ),
                          ),
                          child: Text(
                            'Save',
                            style: PlusJakartaSansStyle.getStyle(
                              weight: 700,
                              fontSize: 16.0,
                              color: Colors.white,
                              uniquifier: 'button',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildTextFields() {
    final fields = {
      'house': 'House Number',
      'area': 'Area',
      'street': 'Street',
      'landmark': 'Landmark',
      'pincode': 'Pincode',
      'city': 'City/Town',
      'district': 'District',
      'state': 'State',
    };

    return fields.entries.map((entry) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 12.0),
        child: TextFormField(
          decoration: InputDecoration(
            labelText: entry.value,
            filled: true,
            fillColor: const Color(0xFFE8E8F2),
            labelStyle: PlusJakartaSansStyle.getStyle(
              weight: 400,
              fontSize: 14.0,
              color: const Color(0xFF544F94),
              uniquifier: 'label',
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
          ),
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return 'Please enter ${entry.value.toLowerCase()}';
            }
            return null;
          },
          onSaved: (value) {
            addressData[entry.key] = value!.trim();
          },
        ),
      );
    }).toList();
  }
}
