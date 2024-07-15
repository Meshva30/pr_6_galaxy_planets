import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controller/space_controller.dart';

class Detailsscreen extends StatefulWidget {
  const Detailsscreen({super.key});

  @override
  State<Detailsscreen> createState() => _DetailsscreenState();
}

class _DetailsscreenState extends State<Detailsscreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 10),
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
    PlanetProvider planetProvider =
        Provider.of<PlanetProvider>(context, listen: true);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          planetProvider.planetModel!.name,
          style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {
                if (planetProvider.planetModel != null) {
                  planetProvider.toggleLiked(planetProvider.planetModel!);
                }
              },
              icon: Icon(
                Icons.favorite,
                color: planetProvider.planetModel?.liked == true
                    ? Colors.red
                    : Colors.white,
              ),
            ),
          )
        ],
      ),
      body: planetProvider.planetModel != null
          ? SingleChildScrollView(
              child: Column(
                children: [
                  RotationTransition(
                    turns: _controller,
                    child: Hero(
                      tag: 'box',
                      child: Container(
                        height: 350,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image:
                                AssetImage(planetProvider.planetModel!.image),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 670,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        color: Color(0xff333333),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25))),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Distance',
                            style:
                                TextStyle(fontSize: 19, color: Colors.white),
                          ),
                          Text(
                            planetProvider.planetModel!.distance,
                            style: const TextStyle(color: Colors.grey),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'Gravity',
                            style:
                                TextStyle(fontSize: 19, color: Colors.white),
                          ),
                          Text(
                            planetProvider.planetModel!.gravity,
                            style: const TextStyle(color: Colors.grey),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'Velocity',
                            style:
                                TextStyle(fontSize: 19, color: Colors.white),
                          ),
                          Text(
                            planetProvider.planetModel!.velocity,
                            style: const TextStyle(color: Colors.grey),
                          ),
                          const SizedBox(
                            height: 10,
                          ),


                          const Text(
                            'Temperature',
                            style:
                                TextStyle(fontSize: 19, color: Colors.white),
                          ),
                          Text(
                            planetProvider.planetModel!.temperature,
                            style: const TextStyle(color: Colors.grey),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'Planets Description',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 19),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            planetProvider.planetModel!.description,
                            style: const TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          : const Center(
              child: Text(
                'No data available',
                style: TextStyle(color: Colors.white),
              ),
            ),
    );
  }
}
