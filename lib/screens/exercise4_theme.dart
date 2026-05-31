import 'package:flutter/material.dart';

class Themes extends StatefulWidget {
  const Themes({super.key});

  @override
  State<Themes> createState() => _ThemeDemoState();
}

class _ThemeDemoState extends State<Themes> {
  bool darkMode = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      themeMode: darkMode ? ThemeMode.dark : ThemeMode.light,

      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      darkTheme: ThemeData.dark(),

      home: Scaffold(
        appBar: AppBar(
          title: const Text("Exercise 4"),
        ),
        body: Center(
          child: SwitchListTile(
            title: const Text("Dark Mode"),
            value: darkMode,
            onChanged: (value) {
              setState(() {
                darkMode = value;
              });
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}