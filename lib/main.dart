import 'package:flutter/material.dart';

import 'screens/home_screen.dart';
import 'screens/movie_detail_screen.dart';
import 'models/movie.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      initialRoute: '/',

      routes: {
        '/': (context) => const HomeScreen(),
      },

      onGenerateRoute: (settings) {
        if (settings.name == '/detail') {
          final movie =
          settings.arguments as Movie;

          return MaterialPageRoute(
            builder: (_) =>
                MovieDetailScreen(
                  movie: movie,
                ),
          );
        }

        return null;
      },
    );
  }
}