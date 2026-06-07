import 'package:flutter/material.dart';
import '../models/movie.dart';

class MovieDetailScreen extends StatefulWidget {
  final Movie movie;

  const MovieDetailScreen({
    super.key,
    required this.movie,
  });

  @override
  State<MovieDetailScreen> createState() =>
      _MovieDetailScreenState();
}

class _MovieDetailScreenState
    extends State<MovieDetailScreen> {

  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {

    final movie = widget.movie;

    return Scaffold(
      backgroundColor: Colors.grey.shade50,

      appBar: AppBar(
        title: Text(movie.title),
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment:
          CrossAxisAlignment.start,

          children: [

            Stack(
              children: [

                Image.network(
                  movie.posterUrl,
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),

                Container(
                  height: 180,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black54,
                      ],
                    ),
                  ),
                ),

                Positioned(
                  left: 16,
                  bottom: 16,
                  child: Text(
                    movie.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight:
                      FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),

            Padding(
              padding:
              const EdgeInsets.all(16),

              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,

                children: [

                  Wrap(
                    spacing: 8,

                    children:
                    movie.genres.map((genre) {
                      return Chip(
                        label: Text(genre),
                      );
                    }).toList(),
                  ),

                  const SizedBox(height: 16),

                  Text(
                    movie.overview,
                    style:
                    const TextStyle(
                      fontSize: 16,
                      height: 1.5,
                    ),
                  ),

                  const SizedBox(height: 20),

                  Row(
                    mainAxisAlignment:
                    MainAxisAlignment
                        .spaceEvenly,

                    children: [

                      Column(
                        children: [
                          IconButton(
                            onPressed: () {
                              setState(() {
                                isFavorite =
                                !isFavorite;
                              });
                            },
                            icon: Icon(
                              isFavorite
                                  ? Icons.favorite
                                  : Icons
                                  .favorite_border,
                            ),
                          ),
                          const Text(
                              "Favorite"),
                        ],
                      ),

                      const Column(
                        children: [
                          Icon(
                            Icons.star,
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text("Rate"),
                        ],
                      ),

                      const Column(
                        children: [
                          Icon(
                            Icons.share,
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text("Share"),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  const Text(
                    "Trailers",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight:
                      FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  ListView.separated(
                    shrinkWrap: true,

                    physics:
                    const NeverScrollableScrollPhysics(),

                    itemCount:
                    movie.trailers.length,

                    separatorBuilder:
                        (_, __) =>
                    const Divider(),

                    itemBuilder:
                        (context, index) {

                      return ListTile(
                        leading: const Icon(
                          Icons
                              .play_circle_fill,
                        ),
                        title: Text(
                          movie
                              .trailers[index]
                              .title,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}