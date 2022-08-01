import 'package:flutter/material.dart';

class FormInputField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final bool isPrivateInput;
  final TextEditingController controller;
  final bool isSingleLine;
  const FormInputField(
      {super.key,
      required this.labelText,
      required this.hintText,
      required this.controller,
      this.isSingleLine = false,
      this.isPrivateInput = false});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(
        labelText,
        style: const TextStyle(fontSize: 20, color: Colors.white),
        textAlign: TextAlign.start,
      ),
      const SizedBox(
        height: 30,
      ),
      TextField(
        controller: controller,
        obscureText: isPrivateInput,
        maxLines: isSingleLine ? 10 : 1,
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            border: const OutlineInputBorder(),
            hintText: hintText),
      ),
      const SizedBox(
        height: 40,
      ),
    ]);
  }
}
