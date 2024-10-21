import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OtpTextfield extends StatelessWidget {
  final controller;
  const OtpTextfield({required this.controller, required FocusNode focusNode});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 55,
        width: 40,
        child: TextFormField(
            inputFormatters: [LengthLimitingTextInputFormatter(1)],
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                focusedBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.black54))),
            ),
        );
    }
}