import 'package:flutter/material.dart';

class InputControlsDemo extends StatefulWidget {
  const InputControlsDemo({super.key});

  @override
  State<InputControlsDemo> createState() => _InputControlsDemoState();
}

class _InputControlsDemoState extends State<InputControlsDemo> {
  double sliderValue = 50;
  bool switchValue = false;
  String gender = "Male";
  DateTime? selectedDate;

  Future<void> pickDate() async {
    DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );

    if (date != null) {
      setState(() {
        selectedDate = date;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Exercise 2"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text("Slider: ${sliderValue.toStringAsFixed(0)}"),

            Slider(
              value: sliderValue,
              min: 0,
              max: 100,
              onChanged: (value) {
                setState(() {
                  sliderValue = value;
                });
              },
            ),

            SwitchListTile(
              title: const Text("Enable"),
              value: switchValue,
              onChanged: (value) {
                setState(() {
                  switchValue = value;
                });
              },
            ),

            RadioListTile(
              title: const Text("Male"),
              value: "Male",
              groupValue: gender,
              onChanged: (value) {
                setState(() {
                  gender = value!;
                });
              },
            ),

            RadioListTile(
              title: const Text("Female"),
              value: "Female",
              groupValue: gender,
              onChanged: (value) {
                setState(() {
                  gender = value!;
                });
              },
            ),

            ElevatedButton(
              onPressed: pickDate,
              child: const Text("Pick Date"),
            ),

            const SizedBox(height: 10),

            Text(
              selectedDate == null
                  ? "No Date Selected"
                  : selectedDate.toString(),
            )
          ],
        ),
      ),
    );
  }
}