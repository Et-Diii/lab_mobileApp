import 'package:flutter/material.dart';

class FixErrors extends StatelessWidget {
  const FixErrors({super.key});

  @override
  Widget build(BuildContext context) {
    final movies = [
      "Movie A",
      "Movie B",
      "Movie C",
      "Movie D",
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Exercise 5 - Common UI Errors",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Correct ListView inside Column using Expanded",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            // Sửa lỗi ListView trong Column
            Expanded(
              child: ListView.builder(
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const Icon(Icons.movie),
                    title: Text(movies[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}