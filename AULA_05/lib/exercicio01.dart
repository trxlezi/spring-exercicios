import 'package:flutter/material.dart';

void main() {
  runApp(const GridViewExerciseApp());
}

class GridViewExerciseApp extends StatelessWidget {
  const GridViewExerciseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Exercicio 1 - GridView',
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.teal),
      home: const PlacesGridPage(),
    );
  }
}

class Place {
  const Place({required this.title, required this.imageUrl});

  final String title;
  final String imageUrl;
}

class PlacesGridPage extends StatelessWidget {
  const PlacesGridPage({super.key});

  static const places = [
    Place(
      title: 'Chennai\nFlower Market',
      imageUrl: 'https://picsum.photos/seed/flower-market/800/800',
    ),
    Place(
      title: 'Tanjore\nBronze Works',
      imageUrl: 'https://picsum.photos/seed/bronze-works/800/800',
    ),
    Place(
      title: 'Tanjore\nMarket',
      imageUrl: 'https://picsum.photos/seed/tanjore-market/800/800',
    ),
    Place(
      title: 'Tanjore\nThanjavur Temple',
      imageUrl: 'https://picsum.photos/seed/temple-one/800/800',
    ),
    Place(
      title: 'Tanjore\nThanjavur Temple',
      imageUrl: 'https://picsum.photos/seed/temple-two/800/800',
    ),
    Place(
      title: 'Pondicherry\nSalt Farm',
      imageUrl: 'https://picsum.photos/seed/salt-farm/800/800',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GridView')),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final crossAxisCount = constraints.maxWidth >= 800
                ? 3
                : constraints.maxWidth >= 520
                ? 2
                : 1;

            return GridView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: places.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1.08,
              ),
              itemBuilder: (context, index) {
                return PlaceCard(place: places[index]);
              },
            );
          },
        ),
      ),
    );
  }
}

class PlaceCard extends StatelessWidget {
  const PlaceCard({required this.place, super.key});

  final Place place;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            place.imageUrl,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                color: Colors.teal.shade100,
                alignment: Alignment.center,
                child: const Icon(Icons.image_not_supported_outlined, size: 48),
              );
            },
          ),
          DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black.withValues(alpha: 0.68),
                ],
                stops: const [0.48, 1],
              ),
            ),
          ),
          Positioned(
            left: 18,
            right: 18,
            bottom: 18,
            child: Text(
              place.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
                height: 1.05,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
