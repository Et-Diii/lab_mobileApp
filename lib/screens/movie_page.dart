import 'package:flutter/material.dart';

import '../data/movie_data.dart';
import '../widgets/movie_card.dart';
import 'movie_detail_screen.dart';

class MoviePage extends StatelessWidget {
  const MoviePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,

      child: Scaffold(
        appBar: AppBar(
          title: const Text("Movie App"),

          bottom: const TabBar(
            tabs: [
              Tab(text: "Popular"),
              Tab(text: "Upcoming"),
            ],
          ),
        ),

        body: TabBarView(
          children: [

            ListView.builder(
              itemCount: movies.length,

              itemBuilder: (context, index) {
                final movie = movies[index];

                return MovieCard(
                  movie: movie,

                  onTap: () {
                    Navigator.push(
                      context,

                      MaterialPageRoute(
                        builder: (_) =>
                            MovieDetailScreen(
                              movie: movie,
                            ),
                      ),
                    );
                  },
                );
              },
            ),

            ListView.builder(
              itemCount: movies.length,

              itemBuilder: (context, index) {
                final movie = movies[index];

                return MovieCard(
                  movie: movie,

                  onTap: () {
                    Navigator.push(
                      context,

                      MaterialPageRoute(
                        builder: (_) =>
                            MovieDetailScreen(
                              movie: movie,
                            ),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}