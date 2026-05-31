import 'package:flutter/material.dart';

class CoreWidgetsDemo extends StatelessWidget {
  const CoreWidgetsDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Exercise 1"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              "Flutter Core Widgets",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            const Icon(
              Icons.flutter_dash,
              size: 80,
              color: Colors.blue,
            ),

            const SizedBox(height: 20),

            Image.network(
              "https://images.unsplash.com/photo-1518770660439-4636190af475?w=800",
              height: 250,
              fit: BoxFit.cover,
            ),

            const SizedBox(height: 20),

            const Card(
              child: ListTile(
                leading: Icon(Icons.person),
                title: Text("Dơn"),
                subtitle: Text("Flutter Student"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}