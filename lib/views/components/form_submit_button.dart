import 'package:flutter/material.dart';

class FormSubmitButton extends StatelessWidget {
  final String buttonText;
  final Function onPressed;
  const FormSubmitButton(
      {super.key, required this.buttonText, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 55,
        ),
        Center(
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.white,
            ),
            height: 50,
            width: 180,
            child: Center(
              child: TextButton(
                onPressed: () => onPressed(),
                child: Text(
                  buttonText,
                  style:
                      const TextStyle(fontSize: 20, color: Color(0xff154C79)),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
