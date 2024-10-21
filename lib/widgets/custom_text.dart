import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import for TextInputFormatter

class CustomText extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final String labelText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool obscureText; // Parameter for password visibility
  final TextInputType? keyboardType; // Optional keyboard type parameter
  final int? maxLength; // Optional max length parameter

  const CustomText({
    super.key,
    required this.controller,
    required this.hintText,
    required this.labelText,
    this.suffixIcon,
    this.prefixIcon,
    this.obscureText = false, // Default to false
    this.keyboardType, // Optional keyboard type
    this.maxLength, // Optional max length
  });

  @override
  State<CustomText> createState() => _CustomTextState();
}

class _CustomTextState extends State<CustomText> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: widget.obscureText,
      keyboardType: widget.keyboardType,
      inputFormatters: widget.maxLength != null
          ? [
        LengthLimitingTextInputFormatter(widget.maxLength),
        FilteringTextInputFormatter.digitsOnly, // Limit input to digits only for number input
      ]
          : null,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.transparent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.blue),
        ),
        filled: true,
        fillColor: Colors.black26.withOpacity(0.1),
        hintText: widget.hintText,
        labelText: widget.labelText,
        suffixIcon: widget.suffixIcon,
        prefixIcon: widget.prefixIcon,
        counterText: widget.maxLength != null
            ? '${widget.controller.text.length}/${widget.maxLength}'
            : null,
      ),
    );
  }
}

