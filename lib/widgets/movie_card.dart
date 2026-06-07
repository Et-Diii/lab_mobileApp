import 'package:flutter/material.dart';
import '../models/movie.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;
  final VoidCallback onTap;

  const MovieCard({
    super.key,
    required this.movie,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: ListTile(
        leading: Image.network(
          movie.posterUrl,
          width: 60,
          fit: BoxFit.cover,
        ),
        title: Text(movie.title),
        subtitle: Text("⭐ ${movie.rating}"),
        onTap: onTap,
      ),
    );
  }
}