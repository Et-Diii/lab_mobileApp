import 'package:flutter/material.dart';

import '../data/movie_data.dart';
import '../models/movie.dart';
import '../widgets/movie_card.dart';

class GenreScreen extends StatefulWidget {
  const GenreScreen({super.key});

  @override
  State<GenreScreen> createState() =>
      _GenreScreenState();
}

class _GenreScreenState extends State<GenreScreen> {
  String searchQuery = '';

  String selectedSort = 'A-Z';

  final Set<String> selectedGenres = {};

  final List<String> genres = [
    'Action',
    'Drama',
    'Comedy',
    'Adventure',
    'Sci-Fi',
    'Romance',
    'Animation',
  ];

  @override
  Widget build(BuildContext context) {
    List<Movie> visibleMovies =
    allMovies.where((movie) {
      bool searchMatch = movie.title
          .toLowerCase()
          .contains(searchQuery.toLowerCase());

      bool genreMatch =
          selectedGenres.isEmpty ||
              movie.genres.any(
                    (g) =>
                    selectedGenres.contains(g),
              );

      return searchMatch && genreMatch;
    }).toList();

    switch (selectedSort) {
      case 'A-Z':
        visibleMovies.sort(
                (a, b) =>
                a.title.compareTo(b.title));
        break;

      case 'Z-A':
        visibleMovies.sort(
                (a, b) =>
                b.title.compareTo(a.title));
        break;

      case 'Year':
        visibleMovies.sort(
                (a, b) =>
                b.year.compareTo(a.year));
        break;

      case 'Rating':
        visibleMovies.sort(
                (a, b) =>
                b.rating.compareTo(a.rating));
        break;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Find a Movie"),
      ),
      body: SafeArea(
        child: Padding(
          padding:
          const EdgeInsets.all(16),
          child: Column(
            children: [
              TextField(
                decoration:
                const InputDecoration(
                  hintText:
                  "Search movie...",
                  prefixIcon:
                  Icon(Icons.search),
                  border:
                  OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {
                    searchQuery = value;
                  });
                },
              ),

              const SizedBox(height: 16),

              Wrap(
                spacing: 8,
                children:
                genres.map((genre) {
                  return FilterChip(
                    label: Text(genre),
                    selected:
                    selectedGenres
                        .contains(
                        genre),
                    onSelected: (_) {
                      setState(() {
                        if (selectedGenres
                            .contains(
                            genre)) {
                          selectedGenres
                              .remove(
                              genre);
                        } else {
                          selectedGenres
                              .add(
                              genre);
                        }
                      });
                    },
                  );
                }).toList(),
              ),

              const SizedBox(height: 16),

              DropdownButton<String>(
                value: selectedSort,
                items: const [
                  DropdownMenuItem(
                    value: 'A-Z',
                    child: Text('A-Z'),
                  ),
                  DropdownMenuItem(
                    value: 'Z-A',
                    child: Text('Z-A'),
                  ),
                  DropdownMenuItem(
                    value: 'Year',
                    child: Text('Year'),
                  ),
                  DropdownMenuItem(
                    value: 'Rating',
                    child: Text('Rating'),
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    selectedSort = value!;
                  });
                },
              ),

              const SizedBox(height: 16),

              Expanded(
                child: LayoutBuilder(
                  builder:
                      (context, constraints) {
                    if (constraints
                        .maxWidth <
                        800) {
                      return ListView
                          .builder(
                        itemCount:
                        visibleMovies
                            .length,
                        itemBuilder:
                            (context,
                            index) {
                          return MovieCard(
                            movie:
                            visibleMovies[
                            index],
                          );
                        },
                      );
                    }

                    return GridView
                        .count(
                      crossAxisCount: 2,
                      crossAxisSpacing:
                      12,
                      mainAxisSpacing:
                      12,
                      childAspectRatio:
                      1.8,
                      children:
                      visibleMovies
                          .map(
                            (movie) =>
                            MovieCard(
                              movie:
                              movie,
                            ),
                      )
                          .toList(),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}