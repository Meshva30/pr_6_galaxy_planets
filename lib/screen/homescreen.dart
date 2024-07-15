import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pr_6_galaxy_planets/screen/detailsscreen.dart';
import 'package:pr_6_galaxy_planets/screen/model/space_model.dart';
import 'package:provider/provider.dart';

import 'controller/space_controller.dart';
import 'likescreen.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  int _selectedIndex = 0;

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

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (index == 2) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LikesScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    PlanetProvider planetProvider =
        Provider.of<PlanetProvider>(context, listen: true);

    int _tabs = 0;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: const Icon(
          Icons.grid_view_rounded,
          color: Colors.white,
        ),
        title: const Text(
          'Feed',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.circular(7), // Adjust the radius as needed
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(7),
                child: Image.asset(
                  'assets/img/meshva.jpeg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: FutureBuilder(
          future: rootBundle.loadString('assets/jsondata.json'),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return const Center(
                child: Text('Error loading data'),
              );
            } else if (snapshot.hasData) {
              try {
                List<dynamic> jsonData = jsonDecode(snapshot.data!);

                List<Planet> planets =
                    jsonData.map((json) => Planet.fromJson(json)).toList();

                Planet? dataModel = planetProvider.planetModel;
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _tabs = 0;
                              });
                            },
                            child: Container(
                              height: 40,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.white, width: 1),
                                borderRadius: BorderRadius.circular(10),
                                color: _tabs == 0 ? Colors.white : Colors.black,
                              ),
                              child: Container(
                                  margin: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  child: Center(
                                    child: Text(
                                      "All",
                                      style: TextStyle(
                                          color: _tabs == 0
                                              ? Colors.black
                                              : Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  )),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _tabs = 1;
                              });
                            },
                            child: Container(
                              height: 40,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.white, width: 1),
                                borderRadius: BorderRadius.circular(10),
                                color: _tabs == 1 ? Colors.white : Colors.black,
                              ),
                              child: Container(
                                  margin: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  child: Center(
                                    child: Text(
                                      "Planets",
                                      style: TextStyle(
                                          color: _tabs == 1
                                              ? Colors.black
                                              : Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  )),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _tabs = 2;
                              });
                            },
                            child: Container(
                              height: 40,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.white, width: 1),
                                borderRadius: BorderRadius.circular(10),
                                color: _tabs == 2 ? Colors.white : Colors.black,
                              ),
                              child: Container(
                                  margin: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  child: Center(
                                    child: Text(
                                      "Comets",
                                      style: TextStyle(
                                          color: _tabs == 2
                                              ? Colors.black
                                              : Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  )),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _tabs = 3;
                              });
                            },
                            child: Container(
                              height: 40,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.white, width: 1),
                                borderRadius: BorderRadius.circular(10),
                                color: _tabs == 3 ? Colors.white : Colors.black,
                              ),
                              child: Container(
                                  margin: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  child: Center(
                                    child: Text(
                                      "Solar system",
                                      style: TextStyle(
                                          color: _tabs == 3
                                              ? Colors.black
                                              : Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  )),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _tabs = 4;
                              });
                            },
                            child: Container(
                              height: 40,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.white, width: 1),
                                borderRadius: BorderRadius.circular(10),
                                color: _tabs == 4 ? Colors.white : Colors.black,
                              ),
                              child: Container(
                                  margin: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  child: Center(
                                    child: Text(
                                      "Asteroids",
                                      style: TextStyle(
                                          color: _tabs == 4
                                              ? Colors.black
                                              : Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 160,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/img/solar.webp'))),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Popular Planets',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'View More',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 500,
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1 / 1,
                          crossAxisSpacing: 10,
                        ),
                        itemCount: planets.length,
                        itemBuilder: (context, index) {
                          Planet planet = planets[index];
                          return InkWell(
                            onTap: () {
                              planetProvider.setPlanetModel(
                                  planet); // Set the planet model in the provider
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const Detailsscreen(),
                              ));
                            },
                            child: Stack(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 30),
                                  child: Container(
                                    height: 230,
                                    width: 200,
                                    decoration: BoxDecoration(
                                      color: const Color(0xff333333),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Column(
                                      children: [
                                        Align(
                                          alignment: Alignment.topRight,
                                          child: Padding(
                                            padding: const EdgeInsets.all(10),
                                            child: Icon(
                                              planet.liked
                                                  ? Icons.bookmark
                                                  : Icons.bookmark_border,
                                              color: Colors.white,
                                              size: 20,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 40,
                                        ),
                                        Text(
                                          planet.name,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          planet.distance,
                                          style: const TextStyle(
                                            color: Colors.white70,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 10,
                                  bottom: 58,
                                  child: RotationTransition(
                                    turns: _controller,
                                    child: Hero(
                                      tag: 'box',
                                      child: Container(
                                        height: 110,
                                        width: 116,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                                image: AssetImage(planet.image),
                                                fit: BoxFit.cover)),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ]),
                );
              } catch (e) {
                print('Error parsing JSON: $e');
                return const Center(
                  child: Text('Error parsing JSON data'),
                );
              }
            } else {
              return const Center(
                child: Text('No data available'),
              );
            }
          },
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10),
        child: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border),
              label: '',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.white,
          onTap: _onItemTapped,
          backgroundColor: Colors.black,
          unselectedItemColor: Colors.white,
          showUnselectedLabels: true,
        ),
      ),
    );
  }
}
