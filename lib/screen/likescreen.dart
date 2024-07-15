import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controller/space_controller.dart';

class LikesScreen extends StatefulWidget {
  @override
  State<LikesScreen> createState() => _LikesScreenState();
}

class _LikesScreenState extends State<LikesScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Liked Planets',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Consumer<PlanetProvider>(
        builder: (context, provider, child) {
          final likedPlanets = provider.likedPlanets;

          if (likedPlanets.isEmpty) {
            return const Center(child: Text('No liked planets yet.'));
          }

          return ListView.builder(
            itemCount: likedPlanets.length,
            itemBuilder: (context, index) {
              final planet = likedPlanets[index];
              return ListTile(
                leading: RotationTransition(
                    turns: _controller,
                    child: Image.asset(
                      planet.image,
                      fit: BoxFit.cover,
                    )),
                title: Text(
                  planet.name,
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                ),
                subtitle: Text(
                  planet.distance,
                  style: const TextStyle(color: Colors.grey),
                ),
                trailing: IconButton(
                  onPressed: () {
                    provider.toggleLiked(planet);
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
