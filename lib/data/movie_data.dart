import '../models/movie.dart';

final List<Movie> movies = [
  Movie(
    id: 1,
    title: "Dune: Part Two",
    posterUrl:
    "https://images.unsplash.com/photo-1489599849927-2ee91cede3ba",
    overview:
    "Paul Atreides unites with Chani and the Fremen while seeking revenge against the conspirators who destroyed his family.",
    genres: ["Sci-Fi", "Adventure", "Drama"],
    rating: 8.7,
    trailers: [
      Trailer(title: "Official Trailer #1"),
      Trailer(title: "IMAX Sneak Peek"),
    ],
  ),
  Movie(
    id: 2,
    title: "Deadpool & Wolverine",
    posterUrl:
    "https://images.unsplash.com/photo-1506744038136-46273834b3fb",
    overview:
    "The multiverse gets messy when Wade Wilson teams up with Wolverine.",
    genres: ["Action", "Comedy"],
    rating: 8.5,
    trailers: [
      Trailer(title: "Red Band Trailer"),
      Trailer(title: "Behind the Scenes"),
    ],
  ),
];