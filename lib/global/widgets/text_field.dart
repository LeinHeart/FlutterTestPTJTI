import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final bool? obscureText;
  final TextInputType keyboardType;
  final String hintText;
  final String labelText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final String? Function(String?)? validator;

  const CustomTextField({
    Key? key,
    required this.controller,
    this.obscureText,
    required this.keyboardType,
    required this.hintText,
    required this.labelText,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.white,
      keyboardType: keyboardType,
      autofocus: false,
      autocorrect: false,
      enableSuggestions: false,
      obscureText: obscureText ?? false,
      validator: validator,
      controller: controller,
      onSaved: (String? val) {
        controller.text = val!;
      },
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.blue[500]),
        labelText: labelText,
        labelStyle: TextStyle(color: Colors.blue[900]),
        prefixIcon: prefixIcon != null
            ? Icon(
                prefixIcon,
                color: Colors.blue[900],
              )
            : null,
        fillColor: Colors.white,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: const BorderSide(
            color: Colors.blue,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: const BorderSide(
            color: Colors.grey,
            width: 2.0,
          ),
        ),
      ),
      style: TextStyle(fontSize: 16.0, color: Colors.blue[900]),
    );
  }
}
