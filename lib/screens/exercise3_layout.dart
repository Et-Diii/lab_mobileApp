import 'package:flutter/material.dart';

class Layout extends StatelessWidget {
  const Layout({super.key});

  @override
  Widget build(BuildContext context) {
    final movies = [
      {"title": "Avatar", "icon": "A"},
      {"title": "Inception", "icon": "I"},
      {"title": "Interstellar", "icon": "I"},
      {"title": "Joker", "icon": "J"},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Exercise 3 - Layout Demo"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            const SizedBox(height: 20),

            const Text(
              "Now Playing",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: ListView.builder(
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 3,
                          color: Colors.black12,
                          offset: Offset(0, 2),
                        )
                      ],
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      leading: CircleAvatar(
                        radius: 22,
                        backgroundColor: Colors.deepPurple.shade100,
                        child: Text(
                          movies[index]["icon"]!,
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                      title: Text(
                        movies[index]["title"]!,
                        style: const TextStyle(
                          fontSize: 22,
                        ),
                      ),
                      subtitle: const Text(
                        "Sample description",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
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