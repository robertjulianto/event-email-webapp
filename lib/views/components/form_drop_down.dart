import 'package:flutter/material.dart';

class FormDropDown extends StatelessWidget {
  final List<DropdownMenuItem<Object>> items;
  final String value;
  final Function(Object?)? onChanged;
  const FormDropDown(
      {super.key,
      required this.items,
      required this.value,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Text(
              "Event",
              style: TextStyle(fontSize: 20, color: Colors.white),
              textAlign: TextAlign.start,
            ),
            const SizedBox(
              width: 30,
            ),
            DropdownButton(
              isDense: true,
              items: items,
              value: value,
              onChanged: onChanged,
              dropdownColor: const Color(0xff154C79),
            ),
          ],
        ),
        const SizedBox(
          height: 40,
        )
      ],
    );
  }
}
