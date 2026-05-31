import 'package:flutter/material.dart';
import 'screens/exercise1_core_widgets.dart';
import 'screens/exercise2_input_widgets.dart';
import 'screens/exercise3_layout.dart';
import 'screens/exercise4_theme.dart';
import 'screens/exercise5_fix_errors.dart';

void main() {
  runApp(const MyLabApp());
}

class MyLabApp extends StatelessWidget {
  const MyLabApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lab 4 Flutter UI',
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final exercises = [
      {
        "title": "Exercise 1 - Core Widgets",
        "page": const CoreWidgetsDemo(),
      },
      {
        "title": "Exercise 2 - Input Widgets",
        "page": const InputControlsDemo(),
      },
      {
        "title": "Exercise 3 - Layout Basics",
        "page": const Layout(),
      },
      {
        "title": "Exercise 4 - Theme & Scaffold",
        "page": const Themes(),
      },
      {
        "title": "Exercise 5 - Debug Fixes",
        "page": const FixErrors(),
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter UI Fundamentals"),
      ),
      body: ListView.builder(
        itemCount: exercises.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(exercises[index]["title"] as String),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => exercises[index]["page"] as Widget,
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}