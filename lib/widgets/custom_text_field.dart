import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
   CustomTextField({
    super.key,
    required this.hint,
    required this.onChange,
    this.obscureText = false,
    this.keyboardType,
  });

  TextInputType? keyboardType;
  final String hint;
  final void Function(String value) onChange;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        obscureText: obscureText,
          onChanged: onChange,
          keyboardType:keyboardType,
          decoration: InputDecoration(
              hintText: hint,
              hintStyle: const TextStyle(color: Colors.grey),
              enabledBorder: const OutlineInputBorder(),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.indigo),
              ))),
    );
  }
}
